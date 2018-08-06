import React from 'react'
import {Query} from "react-apollo"
import {getCategories} from '../../../graphql/queries/categoryQueries.graphql'
import Category from "../Category"
import PropTypes from 'prop-types'

function Categories(props) {
  return (
    <Query
      query={getCategories}>
      {({loading, error, data}) => {
        if (error) return <div>ocorreu um erro inesperado...</div>
        if (loading) return <div>carregando...</div>

        return (
          <div className={["categories", props.active ? 'active' : ''].join(' ')}>
            {data.categories.map(category => (
              <Category hide={props.hide} key={category.id} category={category}/>
            ))}
          </div>
        )
      }}
    </Query>
  )
}

Categories.propTypes = {
  hide: PropTypes.func,
  active: PropTypes.bool
}

export default Categories