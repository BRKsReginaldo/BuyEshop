import React, {Component, Fragment} from 'react'
import {graphql} from 'react-apollo'
import {compose} from "redux"
import mapProps from "../../hoc/mapProps"
import PropTypes from 'prop-types'
import {getProducts} from '../../graphql/queries/productQueries.graphql'
import LoadingScreen from "../../components/UI/LoadingScreen"
import ErrorScreen from "../../components/UI/ErrorScreen"
import Product from "../../components/UI/Product"
import ProductDetails from "../../components/UI/ProductDetails"
import {hasMorePages} from "../../reuseable/logics"
import Paginator from "../../reuseable/Paginator"

@compose(
  mapProps(props => ({
    category_id: props.category.id
  })),
  graphql(getProducts, {
    options: props => ({
      variables: {
        limit: 24,
        category_id: props.category_id
      }
    })
  })
)
class ListCategoryProducts extends Component {
  state = {
    showcaseProduct: null,
  }

  fetchMore = () => {
    let paginator = new Paginator(this, 'products', getProducts)

    if (!paginator.hasPages()) return

    paginator.tryFetchMore()
  }

  setShowcaseProduct = product => {
    this.setState({
      showcaseProduct: product
    })
  }

  render() {
    if (this.props.data.loading && !this.props.data.products) return <LoadingScreen/>
    if (this.props.data.error) return <ErrorScreen/>
    if (!this.props.data.products) return <ErrorScreen/>

    return (
      <Fragment>
        <div className="products">
          {this.props.data.products.items.map(product => (
            <div
              onClick={() => this.setShowcaseProduct(product)}
              className="products__product" key={product.id}>
              <Product product={product}/>
            </div>
          ))}
          {!this.props.data.products.items.length && (
            <div className="empty-message">não há nenhum produto nesta categoria...</div>
          )}
          <ProductDetails close={() => this.setShowcaseProduct(null)} product={this.state.showcaseProduct}/>
        </div>
        {!!this.props.data.products.items.length &&
        hasMorePages(this.props.data.products.cursor.currentPage,
          this.props.data.products.cursor.perPage,
          this.props.data.products.cursor.total) && (
          <div className="page__actions">
            <div
              onClick={() => this.fetchMore()}
              className="fetch-more">Carregar
              mais {this.props.data.loading && !!this.props.data.products.items.length && (
                <span className="fas fa-spinner fa-spin"/>
              )}
            </div>
          </div>
        )}
      </Fragment>
    )
  }
}

ListCategoryProducts.propTypes = {
  category: PropTypes.object.isRequired,
  limit: PropTypes.number
}

export default ListCategoryProducts