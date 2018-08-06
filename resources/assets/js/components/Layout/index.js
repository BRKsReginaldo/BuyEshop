import React from 'react'
import Navbar from "../UI/Navbar"
import Content from "../Content"
import TopBar from "../UI/TopBar"

function Layout(props) {
  return (
    <div className="app-root">
      <TopBar/>
      <Navbar/>
      <Content>
        {props.children}
      </Content>
    </div>
  )
}

export default Layout