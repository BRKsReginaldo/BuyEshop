import React from 'react'
import {Link} from "react-router-dom"
import PropTypes from 'prop-types'
import {breakpoints, matchQuery} from "../../../reuseable/breakpoints"

function Category(props) {
  const hide = () => {
    if (!matchQuery(breakpoints.tabletSm)) {
      props.hide()
    }
  }

  return (
    <Link to={`/${props.category.slug}`} onClick={hide} className={[
      "category",
      (() => {
        if (new RegExp(`\/${props.category.slug}`).test(window.location.pathname)) {
          return 'active'
        }
        return null
      })()
    ].join(' ')}>
      {props.category.name}
    </Link>
  )
}

Category.propTypes = {
  category: PropTypes.object,
  hide: PropTypes.func
}

export default Category