import React from 'react'
import Breakthrough from './BreakThroughApp'
import { ActionCableProvider } from 'react-actioncable-provider'

export default function App () {
    return (
    <ActionCableProvider url="ws://localhost:3000/cable">
      <Breakthrough />
    </ActionCableProvider>
  )
}