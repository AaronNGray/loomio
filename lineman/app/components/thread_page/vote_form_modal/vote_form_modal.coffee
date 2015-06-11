angular.module('loomioApp').factory 'VoteFormModal', (BaseModal) ->
  class VoteFormModal extends BaseModal
    templateUrl: 'generated/components/thread_page/vote_form_modal/vote_form_modal.html'
    controller: ($scope, proposal, Records, CurrentUser, FlashService) ->
      $scope.proposal = proposal
      $scope.editing = false

      $scope.changeVote = ->
        $scope.editing = true

      $scope.vote = Records.votes.initialize({proposal_id: $scope.proposal.id})

      $scope.submit = ->
        $scope.vote.save().then ->
          FlashService.success 'vote_form_modal.submitted_your_vote'
          $scope.editing = false
          $scope.vote = Records.votes.initialize({proposal_id: $scope.proposal.id})

      $scope.yourLastVote = ->
        $scope.proposal.lastVoteByUser(CurrentUser)

      $scope.cancel = ->
        $scope.editing = false
        $scope.vote.position = null

      $scope.positionOtherThan = (position) ->
        $scope.vote.position? && $scope.vote.position != position

