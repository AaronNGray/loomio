angular.module('loomioApp').directive 'proposalOutcomePanel', ->
  scope: {proposal: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_page/proposal_outcome_panel/proposal_outcome_panel.html'
  replace: true
  controller: ($scope, CurrentUser, ProposalFormService) ->

    $scope.showSetOutcome = ->
      ($scope.proposal.isClosed()) and
      (!$scope.proposal.hasOutcome()) and
      (($scope.proposal.author() == CurrentUser) or
       ($scope.proposal.group().coordinatorsIncludes(CurrentUser)))

    $scope.currentUser = ->
      CurrentUser

    $scope.openProposalOutcomeForm = ->
      ProposalFormService.openSetOutcomeModal($scope.proposal)


    # $scope.openForm = ->
    #   ProposalFormService.openStartProposalModal($scope.discussion)

    return
