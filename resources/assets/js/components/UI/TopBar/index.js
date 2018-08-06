import React, {Component, Fragment} from 'react'
import Drawer from "./Drawer"
import {breakpoints, matchQuery} from "../../../reuseable/breakpoints"
import {Link} from "react-router-dom"

class TopBar extends Component {
  state = {
    animating: false,
    show: false,
    active: false
  }

  componentDidMount() {
    window.addEventListener('scroll', this.onScroll, false)
  }

  componentWillUnmount() {
    window.removeEventListener('scroll', this.onScroll, false)
  }

  onScroll = ev => {
    let offset = window.pageYOffset

    if (!matchQuery(breakpoints.tabletSm)()) {
      if (offset >= 165 && !this.state.active) {
        this.setState({
          active: true
        })
      } else if (offset < 165 && this.state.active) {
        this.setState({
          active: false
        })
      }
    }
  }

  onTransitionEnd = () => {
    this.setState({
      animating: false
    })
  }

  toggleMenu = () => {
    this.setState({
      animating: true
    }, () => {
      this.setState({
        show: !this.state.show
      })
    })
  }

  render() {
    return (
      <Fragment>
        <nav
          style={{
            display: this.state.active ? 'flex' : 'none'
          }}
          className="top-bar">
          <Link to="/" className="top-bar__logo">
            <img src="/icons/logo_32x32.png" alt="Logo Buy-Eshop"/>

          </Link>
          <div className="top-bar__categories-trigger">
            <button
              onClick={this.toggleMenu}
              className="top-bar__trigger">
              <span className="fas fa-bars"/>
            </button>
          </div>
        </nav>
        <Drawer
          onTransitionEnd={this.onTransitionEnd}
          toggleMenu={this.toggleMenu}
          show={this.state.show}
          animating={this.state.animating}/>
      </Fragment>
    )
  }
}

export default TopBar