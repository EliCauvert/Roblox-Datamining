local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local avatarEditorService = game:GetService("AvatarEditorService")

local function _(p0) --[[ line: 42 | named "getEmoteLabel" ]]
	local name = p0.Name or p0.name
	
	return if typeof(name) == "string" and name ~= "" then name else ""
end

local function getCurrentPageItems(p1) --[[ line: 51 ]]
	local t = {}
	
	for i, v in p1:GetCurrentPage() do
		local t_1 = { id = tostring(v.AssetId) }
		local name = v.Name or v.name
		t_1.label = if typeof(name) == "string" and name ~= "" then name else ""
		table.insert(t, t_1)
	end
	return t
end

return function() --[[ line: 62 | named "useOwnedEmotes" ]]
	-- upvalues: reactModule (ref), cryoModule (ref), getCurrentPageItems (ref), avatarEditorService (ref), editProfileImageAnalyticsModule (ref)
	local var10, var11 = reactModule.useState({})
	local var12, var13 = reactModule.useState(true)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(0)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useRef(false)
	local var26 = reactModule.useCallback(function(p2, p3) --[[ line: 73 ]]
		-- upvalues: var11 (ref), cryoModule (copy)
		var11(function(p4) --[[ line: 74 ]]
			-- upvalues: p2 (ref), cryoModule (copy), p3 (ref)
			for i, v in p4 do
				if v.id == p2 then
					return p4
				end
			end
			return cryoModule.List.join({ { id = p2, label = p3 or "" } }, p4)
		end)
	end, {})
	local var27 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: var24 (ref), var25 (ref), var13 (ref), var15 (ref), var17 (ref), var19 (ref), var21 (ref), var23 (ref)
		var24.current = nil
		var25.current = false
		var13(true)
		var15(false)
		var17(false)
		var19(false)
		var21(false)
		var23(function(p5) --[[ line: 96 ]]
			return p5 + 1
		end)
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var24 (ref), var25 (ref), var19 (ref), var21 (ref), getCurrentPageItems (copy), var11 (ref), cryoModule (copy), var17 (ref)
		local current = var24.current
		
		if current == nil or current.IsFinished or var25.current then
			return
		end
		var25.current = true
		var19(true)
		var21(false)
		task.spawn(function() --[[ line: 110 ]]
			-- upvalues: current (ref), getCurrentPageItems (copy), var25 (copy), var19 (copy), var11 (copy), cryoModule (copy), var17 (copy), var21 (copy)
			local ok, status = pcall(function() --[[ line: 111 ]]
				-- upvalues: current (copy), getCurrentPageItems (copy)
				current:AdvanceToNextPageAsync()
				
				return getCurrentPageItems(current)
			end)
			var25.current = false
			var19(false)
			
			if ok then
				var11(function(p6) --[[ line: 119 ]]
					-- upvalues: cryoModule (copy), status (ref)
					return cryoModule.List.join(p6, status)
				end)
				var17(not current.IsFinished)
				
				return
			end
			var21(true)
		end)
	end, {})
	reactModule.useEffect(function() --[[ line: 129 ]]
		-- upvalues: var24 (ref), var25 (ref), var19 (ref), var21 (ref), avatarEditorService (copy), getCurrentPageItems (copy), var11 (ref), var17 (ref), editProfileImageAnalyticsModule (copy), var15 (ref), var13 (ref)
		local var29 = false
		var24.current = nil
		var25.current = false
		var19(false)
		var21(false)
		task.spawn(function() --[[ line: 136 ]]
			-- upvalues: avatarEditorService (copy), getCurrentPageItems (copy), var29 (write), var24 (copy), var11 (copy), var17 (copy), editProfileImageAnalyticsModule (copy), var15 (copy), var13 (copy)
			local ok, status = pcall(function() --[[ line: 137 ]]
				-- upvalues: avatarEditorService (copy), getCurrentPageItems (copy)
				local var30 = avatarEditorService:GetInventoryAsync({ Enum.AvatarAssetType.EmoteAnimation })
				
				return { items = getCurrentPageItems(var30), pageObject = var30 }
			end)
			
			if var29 then return end
			if ok then
				var24.current = status.pageObject
				var11(status.items)
				var17(not status.pageObject.IsFinished)
			else
				editProfileImageAnalyticsModule.logFetchFailure({ assetType = "emotes" })
				var15(true)
				var17(false)
			end
			var13(false)
		end)
		
		return function() --[[ line: 163 ]]
			-- upvalues: var29 (write)
			var29 = true
		end
	end, { var22 })
	
	return {
		emoteItems = var10,
		isLoading = var12,
		hasError = var14,
		refetch = var27,
		onMoreEmotes = var28,
		hasMoreEmotes = var16,
		isLoadingMoreEmotes = var18,
		hasLoadMoreError = var20,
		markEmoteOwned = var26
	}
end