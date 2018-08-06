import React, {Component} from 'react'
import Routes from "./components/Routes"
import Layout from "./components/Layout"

class Root extends Component {
  render() {
    return (
      <Layout>
        <Routes/>
      </Layout>
    )
  }
}

export default Root