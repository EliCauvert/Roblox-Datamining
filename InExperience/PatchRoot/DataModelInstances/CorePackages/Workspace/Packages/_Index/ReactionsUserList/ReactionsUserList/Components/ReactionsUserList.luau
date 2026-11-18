local Parent = script:FindFirstAncestor("ReactionsUserList").Parent
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local UserListModule = require(Parent.UserList)
local Reaction = ReactionsModule.Reaction
local ReactionSize = ReactionsModule.Enums.ReactionSize
local VerticalUserList = UserListModule.VerticalUserList.VerticalUserList
local EntityType = UserListModule.Enums.EntityType
local Configs = { showPresence = false, showSubtitle = false }

return function(p1)
	-- upvalues: ReactModule (copy), EntityType (copy), Reaction (copy), ReactionSize (copy), VerticalUserList (copy), Configs (copy)
	local LocalUserId = p1.localUserId
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), EntityType (upval), LocalUserId (copy)
		local List = {}
		local ReactionTypes = {}
		local v1 = nil
		
		for _, userReaction in p1.userReactions do
			local UserId = userReaction.userId
			
			if ReactionTypes[UserId] == nil then
				ReactionTypes[UserId] = userReaction.reactionType
				local config = { id = UserId, type = EntityType.User }
				
				if UserId == LocalUserId then
					v1 = config
				else
					table.insert(List, config)
				end
			end
		end
		if v1 then
			table.insert(List, 1, v1)
		end
		return List, ReactionTypes
	end, { p1.userReactions, LocalUserId })
	local UseResult = ReactModule.useCallback(function(Callback, p2)
		-- upvalues: LocalUserId (copy), ReactModule (upval), Reaction (upval), UseMemoResult2 (copy), ReactionSize (upval), p1 (copy)
		local IsIdMatch = p2.id == LocalUserId
		
		return Callback({
			trailingContent = ReactModule.createElement(Reaction, {
				reactionType = UseMemoResult2[p2.id],
				size = ReactionSize.Medium
			}),
			contextualInfo = if IsIdMatch then { text = p1.tapToRemoveText } else nil,
			onRowActivated = if IsIdMatch then function()
				-- upvalues: p1 (upval)
				p1.onRemoveReaction()
			end else nil
		})
	end, {
		UseMemoResult2,
		LocalUserId,
		p1.tapToRemoveText,
		p1.onRemoveReaction
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		if p1.onUserSelected then
			p1.onUserSelected(p2)
		end
	end, { p1.onUserSelected })
	
	return if #UseMemoResult == 0 then nil else ReactModule.createElement(VerticalUserList, {
		entities = UseMemoResult,
		renderRow = UseResult,
		onRowSelected = UseResult1,
		configs = Configs,
		isScrollEnabled = p1.isScrollEnabled,
		layoutOrder = p1.layoutOrder
	})
end