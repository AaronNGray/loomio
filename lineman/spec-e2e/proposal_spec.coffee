describe 'Proposals', ->

  DiscussionPage = require './helpers/discussion_page.coffee'
  proposalsHelper = require './helpers/proposals_helper.coffee'
  page = new DiscussionPage

  describe 'starting a proposal', ->

    beforeEach ->
      page.load()

    it 'successfully starts a new proposal', ->
      proposalsHelper.startProposalBtn().click()
      proposalsHelper.fillInProposalForm({ title: 'New proposal', details: 'Describing the proposal' })
      proposalsHelper.submitProposalForm()
      # expect(page.flashMessageText()).toContain('Successfully created your proposal')

  describe 'voting on a proposal', ->
    beforeEach ->
      page.loadWithActiveProposal()

    it 'successfully votes on a proposal', ->
      proposalsHelper.agreeBtn().click()
      proposalsHelper.voteStatementField().sendKeys('This is a good idea')
      proposalsHelper.submitVoteForm()
      expect(proposalsHelper.positionsList().getText()).toContain('This is a good idea')

  describe 'editing a proposal', ->
    beforeEach ->
      page.loadWithActiveProposal()

    it 'successfully edits a proposal when there are no votes', ->
      proposalsHelper.proposalActionsDropdown().click()
      proposalsHelper.proposalActionsDropdownEdit().click()
      proposalsHelper.fillInProposalForm({ title: 'Edited proposal' })
      proposalsHelper.saveProposalChangesBtn().click()
      expect(proposalsHelper.currentProposalHeading().getText()).toContain('Edited proposal')

  describe 'closing a proposal', ->
    beforeEach ->
      page.loadWithActiveProposal()

    it 'successfully closes a proposal', ->
      proposalsHelper.proposalActionsDropdown().click()
      proposalsHelper.proposalActionsDropdownClose().click()
      proposalsHelper.closeProposalButton().click()
      expect(proposalsHelper.previousProposalsList().getText()).toContain('lets go hiking')

  describe 'setting a proposal outcome', ->
    beforeEach ->

    it 'successfully creates a proposal outcome', ->
      page.loadWithClosedProposal()
      proposalsHelper.proposalExpandLink().click()
      proposalsHelper.setProposalOutcomeBtn().click()
      proposalsHelper.fillInProposalOutcomeForm({ body: 'Everyone is happy!' })
      proposalsHelper.submitProposalOutcomeForm()
      expect(proposalsHelper.currentExpandedProposalOutcome().getText()).toContain('Everyone is happy!')

    # it 'successfully edits a proposal outcome', ->
    #   page.loadWithSetOutcome()
    #   proposalsHelper.proposalExpandLink().click()
