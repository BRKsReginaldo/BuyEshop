import React, {Component} from 'react'
import Product from "../Product"
import PropTypes from 'prop-types'
import ProductDetails from "../ProductDetails"


class Showcase extends Component {
  state = {
    showcaseProduct: null
  }

  setShowcaseProduct = product => {
    this.setState({
      showcaseProduct: product
    })
  }


  render() {
    const {props} = this
    return (
      <div className="showcase">
        {props.products.map(product => (
          <div
            onClick={() => this.setShowcaseProduct(product)}
            key={product.id}
            className="showcase__product products__product">
            <Product
              product={product}/>
          </div>
        ))}

        <ProductDetails close={() => this.setShowcaseProduct(null)} product={this.state.showcaseProduct}/>
      </div>
    )
  }
}

Showcase.propTypes = {
  products: PropTypes.array
}

Showcase.defaultProps = {
  products: []
}

export default Showcase