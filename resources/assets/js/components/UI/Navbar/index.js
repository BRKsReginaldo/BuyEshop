import React, {Component} from 'react'
import Categories from "../Categories"
import {toggleShowEvolution} from "../../../reuseable/evolutions"
import {breakpoints, matchQuery} from "../../../reuseable/breakpoints"
import {Link} from "react-router-dom"

class Navbar extends Component {
  state = {
    show: false
  }

  componentDidMount() {
    if (matchQuery(breakpoints.tabletSm)()) {
     this.setState({
       show: true
     })
    }
  }

  toggle = () => {
    this.setState(toggleShowEvolution())
  }

  hide = () => {
    this.setState(toggleShowEvolution('show', false))
  }

  render() {
    return (
      <nav className="navbar">
        <Link to="/" className="navbar__logo">
          <img src="/icons/logo_120x120.png" alt="Logo Buy-Eshop"/>
        </Link>
        <div className="navbar__categories">
          <div
            onClick={this.toggle}
            className="navbar__categories-trigger"
          >
            Menu
          </div>
          <Categories hide={this.hide} active={this.state.show}/>
        </div>
      </nav>
    )
  }
}

export default Navbar