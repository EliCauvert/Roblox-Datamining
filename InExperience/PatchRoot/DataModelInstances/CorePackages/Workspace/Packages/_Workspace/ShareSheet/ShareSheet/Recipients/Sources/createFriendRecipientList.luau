local ShareSheet = script:FindFirstAncestor("ShareSheet")
local SignalsModule = require(ShareSheet.Parent.Signals)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Types)

local function _(p1)
	if (tonumber(p1) or 0) <= 0 then
		error(`Friends returned an invalid user id: {p1}`)
	end
end

local function areSameRecipients(List, p1): boolean
	if #List ~= #p1 then
		return false
	end
	for i, value in List do
		if p1[i] ~= value then
			return false
		end
	end
	return true
end

return function(p2)
	-- upvalues: SignalsModule (copy), RecipientModule (copy), areSameRecipients (copy)
	local t = {}
	local Computed = SignalsModule.createComputed(function(p3)
		-- upvalues: p2 (copy), t (copy), RecipientModule (upval)
		local List = {}
		local t1 = {}
		
		for _, userId in p2.getPage(p3).userIds do
			if (tonumber(userId) or 0) <= 0 then
				error(`Friends returned an invalid user id: {userId}`)
			end
			if t1[userId] then
				error(`Duplicate user id in the friends page: {userId}`)
			end
			t1[userId] = true
			local Entry = t[userId] or RecipientModule.fromUserId(userId)
			t[userId] = Entry
			table.insert(List, Entry)
		end
		return List
	end, areSameRecipients)
	local Computed1 = SignalsModule.createComputed(function(p4)
		-- upvalues: p2 (copy), Computed (copy)
		local Page = p2.getPage(p4)
		
		return {
			recipients = Computed(p4),
			status = Page.status,
			nextPageToken = Page.nextPageToken,
			isFetchingNextPage = Page.isFetchingNextPage
		}
	end)
	
	return {
		getResult = Computed1,
		refresh = p2.refresh,
		search = p2.search,
		loadMore = function(NextPageToken)
			-- upvalues: Computed1 (copy), p2 (copy)
			local ComputedResult = Computed1(false)
			
			if ComputedResult.nextPageToken == NextPageToken and not ComputedResult.isFetchingNextPage then
				p2.fetchNextPage()
			end
		end
	}
end