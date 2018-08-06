import React from 'react'
import PropTypes from 'prop-types'
import Categories from "../Categories"

function Drawer(props) {
  return (
    <div
      onTransitionEnd={props.onTransitionEnd}
      onClick={props.toggleMenu}
      className={[
        "top-bar__drawer",
        props.show ? 'top-bar__drawer--visible' : '',
        props.animating ? 'top-bar__drawer--animating' : ''
      ].join(' ')}>
      <div onClick={ev => ev.stopPropagation()} className="top-bar__drawer-content">
        <div className="text-center">
          <img src="/icons/logo_120x120.png"/>
        </div>
        <Categories active hide={props.toggleMenu}/>
      </div>
    </div>
  )
}

Drawer.propTypes = {
  animating: PropTypes.bool,
  show: PropTypes.bool,
  toggleMenu: PropTypes.func,
  onTransitionEnd: PropTypes.func
}

export default Drawer