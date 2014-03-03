l = require('lodash')
React = require('react')

{div, p} = React.DOM

Chart = require('../charts/chart')
Bar = require('../charts/bar')

module.exports = React.createClass
  getDefaultProps: ->
    width: 200
    height: 300
    lineHeight: 5

  render: ->
    maxNum = _.max @props.distribution, _.identity
    # minNum = _.min @props.distribution, _.identity

    lines = l(@props.distribution)
      .pairs()
      .sortBy ([title, num]) -> -1 * num
      .map ([title, num]) =>
        width = @props.width * (num / maxNum)

        label = (p {className: 'chart-vertical-label'}, "#{title} (#{num})")

        bar = (div {
          className: 'chart-vertical-bar'
          style:
            width: width
            height: @props.lineHeight
        }, [])

        return (div {className: 'chart-vertical-line'}, [
          label
          bar
        ])

    (div {
      className: 'chart chart-vertical-bars'
    },
      lines
    )