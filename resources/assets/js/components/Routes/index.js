import React, {Fragment} from 'react'
import {Route, Switch} from "react-router-dom"

// Pages
import Home from '../../pages/Home'
import ShowCategory from "../../pages/ShowCategory"


function Routes(props) {
  return (
    <Switch>
      <Route exact path="/" component={Home}/>
      <Route exact path="/:category" component={ShowCategory}/>
    </Switch>
  )
}

export default Routes