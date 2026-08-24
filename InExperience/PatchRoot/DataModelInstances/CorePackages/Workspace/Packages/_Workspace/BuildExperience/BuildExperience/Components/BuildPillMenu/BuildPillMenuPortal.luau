local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var2 = if fFlagBuildDesktopReadinessModule then require(parent.Display) else nil
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signalsReactModule = require(parent.SignalsReact)
local buildPillMenuModule = require(script.Parent.BuildPillMenu)
local buildPillMenuPageHostModule = require(script.Parent.BuildPillMenuPageHost)
local getBuildPillMenuPortalStoreModule = require(buildExperience.Stores.GetBuildPillMenuPortalStore)
local view = foundationModule.View
local useOverlay = foundationModule.Hooks.useOverlay
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useTokens = foundationModule.Hooks.useTokens

local function _(p0, p1)
	return if p0 == Enum.DisplaySize.Small then p1.Y < p1.X else true
end

local _ = function(p2, p3)
	local var10 = p2.AbsolutePosition - (if p3:IsA("GuiObject") then p3.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(var10.X, var10.Y)
end

return reactModule.memo(function(p4)
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), signalsReactModule (ref), useOverlay (ref), useStyleSheet (ref), fFlagBuildDesktopReadinessModule (ref), useTokens (ref), var2 (ref), reactModule (ref), view (ref), buildPillMenuModule (ref), reactRobloxModule (ref), buildPillMenuPageHostModule (ref)
	local var11 = signalsReactModule.useSignalState(getBuildPillMenuPortalStoreModule().getPortalTarget)
	local var12 = useOverlay()
	local var13 = useStyleSheet()
	local var14 = if fFlagBuildDesktopReadinessModule then useTokens() else nil
	local var15 = if fFlagBuildDesktopReadinessModule then var2.GetDisplayStore(false) else nil
	local var16 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var15.getDisplaySize) else nil
	local var17 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var15.getViewportSize) else nil
	local var18 = reactModule.useRef(nil)
	local var19, var20 = reactModule.useState(nil)
	local var21 = if fFlagBuildDesktopReadinessModule and p4.sheet ~= nil and (if var16 == Enum.DisplaySize.Small then var17.Y < var17.X else true) then p4.sheet else nil
	local var22 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var11 (ref), var12 (ref)
		local current = var18.current
		
		if var11 == nil or var12 == nil or current == nil then
			return
		end
		local var30 = var11.AbsolutePosition - (if var12:IsA("GuiObject") then var12.AbsolutePosition else Vector2.zero)
		current.Position = UDim2.fromOffset(var30.X, var30.Y)
	end, { var11, var12 })
	local var23 = reactModule.useCallback(function(p5)
		-- upvalues: var18 (ref), var22 (ref)
		var18.current = p5
		var22()
	end, { var22 })
	local var24 = reactModule.useCallback(function(p6)
		-- upvalues: var20 (ref)
		var20({ type = "overflow", page = p6 })
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20({ type = "agents" })
	end, {})
	local var26 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20({ type = "invitePicker" })
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20({ type = "playtestManagement" })
	end, {})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20({ type = "creator-credit" })
	end, {})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var20 (ref)
		var20(nil)
	end, {})
	
	if fFlagBuildDesktopReadinessModule then
		reactModule.useLayoutEffect(function()
			-- upvalues: var21 (write)
			if var21 == nil then
				return
			end
			local clipsDescendants = var21.ClipsDescendants
			var21.ClipsDescendants = false
			
			return function()
				-- upvalues: var21 (copy), clipsDescendants (ref)
				var21.ClipsDescendants = clipsDescendants
			end
		end, { var21 })
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagBuildDesktopReadinessModule (copy), var21 (write), var11 (ref), var12 (ref), var22 (ref)
		if fFlagBuildDesktopReadinessModule and var21 ~= nil then return end
		if var11 == nil or var12 == nil then
			return
		end
		var22()
		local var31 = var11:GetPropertyChangedSignal("AbsolutePosition"):Connect(var22)
		local var32 = if var12:IsA("GuiObject") then var12:GetPropertyChangedSignal("AbsolutePosition"):Connect(var22) else nil
		
		return function()
			-- upvalues: var31 (ref), var32 (ref)
			var31:Disconnect()
			
			if var32 ~= nil then
				var32:Disconnect()
			end
		end
	end, {
		if fFlagBuildDesktopReadinessModule then var21 else nil,
		var11,
		var12,
		var22
	})
	
	if var11 == nil or var12 == nil then
		return nil
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, {
		StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var13 }),
		Container = reactModule.createElement(view, {
			ZIndex = 999,
			tag = "auto-xy",
			testId = "build-pill-menu-overlay-container",
			AnchorPoint = if fFlagBuildDesktopReadinessModule and var21 ~= nil then Vector2.new(1, 0) else var11.AnchorPoint,
			Position = if fFlagBuildDesktopReadinessModule and var21 ~= nil then UDim2.fromOffset(-var14.Padding.Large, 0) else nil,
			ref = if fFlagBuildDesktopReadinessModule and var21 ~= nil then nil else var23
		}, {
			Pill = reactModule.createElement(buildPillMenuModule, {
				target = p4.target,
				testId = p4.testId,
				onOpenPage = var24,
				onOpenInvitePicker = var26,
				onOpenAgentsPage = var25,
				onOpenCreatorCreditPage = var28
			})
		})
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactRobloxModule.createPortal(createElement, if fFlagBuildDesktopReadinessModule and var21 ~= nil then var21 else var12),
		Page = reactModule.createElement(buildPillMenuPageHostModule, {
			activePage = var19,
			target = p4.target,
			onClose = var29,
			onInvitesSent = var27,
			onOpenInvitePicker = var26
		})
	})
end)