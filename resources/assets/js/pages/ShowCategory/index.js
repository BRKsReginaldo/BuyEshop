import React, {Component, Fragment} from 'react'
import {compose} from "redux"
import {graphql} from 'react-apollo'
import {getCategory} from '../../graphql/queries/categoryQueries.graphql'
import LoadingScreen from "../../components/UI/LoadingScreen"
import ErrorScreen from "../../components/UI/ErrorScreen"
import mapProps from "../../hoc/mapProps"
import ListCategoryProducts from "./ListCategoryProducts"

@compose(
  mapProps(props => ({
    slug: props.match.params.category
  })),
  graphql(getCategory)
)
class ShowCategory extends Component {
  render() {
    if (this.props.data.loading) return <LoadingScreen/>
    if (this.props.data.error) return <ErrorScreen/>
    if (!this.props.data.category) return <ErrorScreen/>

    return (
      <div className="page">
        <h1 className="page__subtitle">{this.props.data.category.name}</h1>
        <ListCategoryProducts category={this.props.data.category}/>
      </div>
    )
  }
}

export default ShowCategory