angular.module('loomioApp').factory 'ModalService', ($modal, $rootScope) ->
  new class ModalService
    open: (modal, resolve = {}) ->
      $rootScope.$broadcast 'modalOpened'
      $modal.open
        templateUrl: modal.templateUrl
        controller:  modal.controller
        resolve:     resolve

    #modals:
      #invitePeople:
        #template:   'generated/components/group_page/invitation_modal.html'
        #controller: 'InvitationsModalController'
        #locals:   ['group']

      #startThread:
        #template:   'generated/components/thread_page/discussion_form/discussion_form.html'
        #controller: 'DiscussionFormController'
        #locals:   ['discussion']
