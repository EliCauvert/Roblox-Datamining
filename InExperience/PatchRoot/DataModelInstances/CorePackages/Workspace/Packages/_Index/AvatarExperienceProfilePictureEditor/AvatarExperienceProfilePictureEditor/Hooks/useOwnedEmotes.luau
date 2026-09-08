local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local avatarEditorService = game:GetService("AvatarEditorService")

local function _(p1)
	local name = p1.Name or p1.name
	
	return if typeof(name) == "string" and name ~= "" then name else ""
end

local function getCurrentPageItems(p1)
	local t = {}
	
	for i, v in p1:GetCurrentPage() do
		local t_1 = { id = tostring(v.AssetId) }
		local name = v.Name or v.name
		t_1.label = if typeof(name) == "string" and name ~= "" then name else ""
		table.insert(t, t_1)
	end
	return t
end

return function()
	-- upvalues: reactModule (ref), cryoModule (ref), getCurrentPageItems (ref), avatarEditorService (ref), editProfileImageAnalyticsModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState(true)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(0)
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var2 (ref), cryoModule (copy)
		var2(function(p4)
			-- upvalues: p2 (ref), cryoModule (copy), p3 (ref)
			for i, v in p4 do
				if v.id == p2 then
					return p4
				end
			end
			return cryoModule.List.join({ { id = p2, label = p3 or "" } }, p4)
		end)
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var16 (ref), var4 (ref), var6 (ref), var8 (ref), var10 (ref), var12 (ref), var14 (ref)
		var15.current = nil
		var16.current = false
		var4(true)
		var6(false)
		var8(false)
		var10(false)
		var12(false)
		var14(function(p4)
			return p4 + 1
		end)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var16 (ref), var10 (ref), var12 (ref), getCurrentPageItems (copy), var2 (ref), cryoModule (copy), var8 (ref)
		local current = var15.current
		
		if current == nil or current.IsFinished or var16.current then
			return
		end
		var16.current = true
		var10(true)
		var12(false)
		task.spawn(function()
			-- upvalues: current (ref), getCurrentPageItems (copy), var16 (copy), var10 (copy), var2 (copy), cryoModule (copy), var8 (copy), var12 (copy)
			local ok, status = pcall(function()
				-- upvalues: current (copy), getCurrentPageItems (copy)
				current:AdvanceToNextPageAsync()
				
				return getCurrentPageItems(current)
			end)
			var16.current = false
			var10(false)
			
			if ok then
				var2(function(p4)
					-- upvalues: cryoModule (copy), status (ref)
					return cryoModule.List.join(p4, status)
				end)
				var8(not current.IsFinished)
				
				return
			end
			var12(true)
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var16 (ref), var10 (ref), var12 (ref), avatarEditorService (copy), getCurrentPageItems (copy), var2 (ref), var8 (ref), editProfileImageAnalyticsModule (copy), var6 (ref), var4 (ref)
		local var20 = false
		var15.current = nil
		var16.current = false
		var10(false)
		var12(false)
		task.spawn(function()
			-- upvalues: avatarEditorService (copy), getCurrentPageItems (copy), var20 (write), var15 (copy), var2 (copy), var8 (copy), editProfileImageAnalyticsModule (copy), var6 (copy), var4 (copy)
			local ok, status = pcall(function()
				-- upvalues: avatarEditorService (copy), getCurrentPageItems (copy)
				local var21 = avatarEditorService:GetInventoryAsync({ Enum.AvatarAssetType.EmoteAnimation })
				
				return { items = getCurrentPageItems(var21), pageObject = var21 }
			end)
			
			if var20 then return end
			if ok then
				var15.current = status.pageObject
				var2(status.items)
				var8(not status.pageObject.IsFinished)
			else
				editProfileImageAnalyticsModule.logFetchFailure({ assetType = "emotes" })
				var6(true)
				var8(false)
			end
			var4(false)
		end)
		
		return function()
			-- upvalues: var20 (write)
			var20 = true
		end
	end, { var13 })
	
	return {
		emoteItems = var1,
		isLoading = var3,
		hasError = var5,
		refetch = var18,
		onMoreEmotes = var19,
		hasMoreEmotes = var7,
		isLoadingMoreEmotes = var9,
		hasLoadMoreError = var11,
		markEmoteOwned = var17
	}
end