angular.module('loomioApp').directive 'positionButtonsPanel', ->
  scope: {proposal: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_page/position_buttons_panel/position_buttons_panel.html'
  replace: true
  controller: ($scope, ModalService, VoteForm, CurrentUser) ->

    $scope.undecided = ->
      !($scope.proposal.lastVoteByUser(CurrentUser)?)


    $scope.select = (position) ->
      ModalService.open(VoteForm, {proposal: -> $scope.proposal })

