local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var1 = if fFlagBuildDesktopReadinessModule then require(parent.Display) else nil
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signalsReactModule = require(parent.SignalsReact)
local buildPillMenuModule = require(script.Parent.BuildPillMenu)
local buildPillMenuPageHostModule = require(script.Parent.BuildPillMenuPageHost)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local getBuildPillMenuPortalStoreModule = require(buildExperience.Stores.GetBuildPillMenuPortalStore)
local view = foundationModule.View
local useOverlay = foundationModule.Hooks.useOverlay
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useTokens = foundationModule.Hooks.useTokens

local function _(p1, p2)
	return if p1 == Enum.DisplaySize.Small then p2.Y < p2.X else true
end

local _ = function(p1, p2)
	local var2 = p1.AbsolutePosition - (if p2:IsA("GuiObject") then p2.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(var2.X, var2.Y)
end

return reactModule.memo(function(p1)
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), signalsReactModule (ref), useOverlay (ref), useStyleSheet (ref), fFlagBuildDesktopReadinessModule (ref), useTokens (ref), var1 (ref), reactModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), view (ref), buildPillMenuModule (ref), reactRobloxModule (ref), buildPillMenuPageHostModule (ref)
	local var2 = signalsReactModule.useSignalState(getBuildPillMenuPortalStoreModule().getPortalTarget)
	local var3 = useOverlay()
	local var4 = useStyleSheet()
	local var5 = if fFlagBuildDesktopReadinessModule then useTokens() else nil
	local var6 = if fFlagBuildDesktopReadinessModule then var1.GetDisplayStore(false) else nil
	local var7 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var6.getDisplaySize) else nil
	local var8 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var6.getViewportSize) else nil
	local var9 = reactModule.useRef(nil)
	local var10, var11 = reactModule.useState(nil)
	local var12 = if fFlagBuildDesktopReadinessModule and p1.sheet ~= nil and (if var7 == Enum.DisplaySize.Small then var8.Y < var8.X else true) then p1.sheet else nil
	local var13 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var2 (ref), var3 (ref)
		local current = var9.current
		
		if var2 == nil or var3 == nil or current == nil then
			return
		end
		local var14 = var2.AbsolutePosition - (if var3:IsA("GuiObject") then var3.AbsolutePosition else Vector2.zero)
		current.Position = UDim2.fromOffset(var14.X, var14.Y)
	end, { var2, var3 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), var13 (ref)
		var9.current = p2
		var13()
	end, { var13 })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref)
		var11({ type = "overflow", page = p2 })
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11({ type = "agents" })
	end, {})
	local var17 = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11({ type = "asset-library" })
	end, {}) else nil
	local var18 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11({ type = "invitePicker" })
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11({ type = "playtestManagement" })
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11({ type = "creator-credit" })
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11(nil)
	end, {})
	
	if fFlagBuildDesktopReadinessModule then
		reactModule.useLayoutEffect(function()
			-- upvalues: var12 (write)
			if var12 == nil then
				return
			end
			local clipsDescendants = var12.ClipsDescendants
			var12.ClipsDescendants = false
			
			return function()
				-- upvalues: var12 (copy), clipsDescendants (ref)
				var12.ClipsDescendants = clipsDescendants
			end
		end, { var12 })
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagBuildDesktopReadinessModule (copy), var12 (write), var2 (ref), var3 (ref), var13 (ref)
		if fFlagBuildDesktopReadinessModule and var12 ~= nil then return end
		if var2 == nil or var3 == nil then
			return
		end
		var13()
		local var22 = var2:GetPropertyChangedSignal("AbsolutePosition"):Connect(var13)
		local var23 = if var3:IsA("GuiObject") then var3:GetPropertyChangedSignal("AbsolutePosition"):Connect(var13) else nil
		
		return function()
			-- upvalues: var22 (ref), var23 (ref)
			var22:Disconnect()
			
			if var23 ~= nil then
				var23:Disconnect()
			end
		end
	end, {
		if fFlagBuildDesktopReadinessModule then var12 else nil,
		var2,
		var3,
		var13
	})
	
	if var2 == nil or var3 == nil then
		return nil
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, {
		StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var4 }),
		Container = reactModule.createElement(view, {
			ZIndex = 999,
			tag = "auto-xy",
			testId = "build-pill-menu-overlay-container",
			AnchorPoint = if fFlagBuildDesktopReadinessModule and var12 ~= nil then Vector2.new(1, 0) else var2.AnchorPoint,
			Position = if fFlagBuildDesktopReadinessModule and var12 ~= nil then UDim2.fromOffset(-var5.Padding.Large, 0) else nil,
			ref = if fFlagBuildDesktopReadinessModule and var12 ~= nil then nil else var14
		}, {
			Pill = reactModule.createElement(buildPillMenuModule, {
				target = p1.target,
				testId = p1.testId,
				onOpenPage = var15,
				onOpenInvitePicker = var18,
				onOpenAgentsPage = var16,
				onOpenAssetLibraryPage = var17,
				onOpenCreatorCreditPage = var20
			})
		})
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactRobloxModule.createPortal(createElement, if fFlagBuildDesktopReadinessModule and var12 ~= nil then var12 else var3),
		Page = reactModule.createElement(buildPillMenuPageHostModule, {
			activePage = var10,
			target = p1.target,
			onClose = var21,
			onInvitesSent = var19,
			onOpenInvitePicker = var18
		})
	})
end)