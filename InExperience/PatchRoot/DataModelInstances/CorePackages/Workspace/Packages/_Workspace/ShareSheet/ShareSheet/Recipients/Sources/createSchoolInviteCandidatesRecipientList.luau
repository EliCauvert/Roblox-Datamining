local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local SchoolInviteCandidatesModule = require(Parent.SchoolInviteCandidates)
local SignalsModule = require(Parent.Signals)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local _ = require(ShareSheet.Types)
local CreateFriendRecipientListModule = require(script.Parent.createFriendRecipientList)

return function()
	-- upvalues: LocalUserIdStore (copy), SchoolInviteCandidatesModule (copy), SignalsModule (copy), ListRecipientsStatusModule (copy), CreateFriendRecipientListModule (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	assert(CurrentUserId ~= "", "School invite candidates require a local user id")
	local InviteCandidatesStore = SchoolInviteCandidatesModule.getInviteCandidatesStore(false)
	local InviteCandidates = InviteCandidatesStore.getInviteCandidates(CurrentUserId)
	
	return CreateFriendRecipientListModule({
		getPage = SignalsModule.createComputed(function(p1)
			-- upvalues: InviteCandidates (copy), ListRecipientsStatusModule (upval)
			local DataResult = InviteCandidates.data(p1)
			local UserIds = {}
			
			if DataResult ~= nil then
				for _, value in DataResult do
					table.insert(UserIds, value.userId)
				end
			end
			return {
				nextPageToken = nil,
				isFetchingNextPage = false,
				userIds = UserIds,
				status = if InviteCandidates.status(p1) == "Failed" then ListRecipientsStatusModule.Failed elseif DataResult == nil then ListRecipientsStatusModule.Loading else ListRecipientsStatusModule.Ready
			}
		end),
		fetchNextPage = function() end,
		refresh = function()
			-- upvalues: InviteCandidatesStore (copy), CurrentUserId (copy)
			InviteCandidatesStore.getInviteCandidates(CurrentUserId)
		end
	})
end