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
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local getBuildPillMenuPortalStoreModule = require(buildExperience.Stores.GetBuildPillMenuPortalStore)
local view = foundationModule.View
local useOverlay = foundationModule.Hooks.useOverlay
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useTokens = foundationModule.Hooks.useTokens

local function _(p0, p1) --[[ line: 32 | named "isSideSheet" ]]
	return if p0 == Enum.DisplaySize.Small then p1.Y < p1.X else true
end

local _ = function(p2, p3) --[[ line: 36 | named "getOverlayPosition" ]]
	local var11 = p2.AbsolutePosition - (if p3:IsA("GuiObject") then p3.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(var11.X, var11.Y)
end

return reactModule.memo(function(p4) --[[ line: 43 | named "BuildPillMenuPortal" ]]
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), signalsReactModule (ref), useOverlay (ref), useStyleSheet (ref), fFlagBuildDesktopReadinessModule (ref), useTokens (ref), var2 (ref), reactModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), view (ref), buildPillMenuModule (ref), reactRobloxModule (ref), buildPillMenuPageHostModule (ref)
	local var12 = signalsReactModule.useSignalState(getBuildPillMenuPortalStoreModule().getPortalTarget)
	local var13 = useOverlay()
	local var14 = useStyleSheet()
	local var15 = if fFlagBuildDesktopReadinessModule then useTokens() else nil
	local var16 = if fFlagBuildDesktopReadinessModule then var2.GetDisplayStore(false) else nil
	local var17 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var16.getDisplaySize) else nil
	local var18 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var16.getViewportSize) else nil
	local var19 = reactModule.useRef(nil)
	local var20, var21 = reactModule.useState(nil)
	local var22 = if fFlagBuildDesktopReadinessModule and p4.sheet ~= nil and (if var17 == Enum.DisplaySize.Small then var18.Y < var18.X else true) then p4.sheet else nil
	local var23 = reactModule.useCallback(function() --[[ line: 63 ]]
		-- upvalues: var19 (ref), var12 (ref), var13 (ref)
		local current = var19.current
		
		if var12 == nil or var13 == nil or current == nil then
			return
		end
		local var32 = var12.AbsolutePosition - (if var13:IsA("GuiObject") then var13.AbsolutePosition else Vector2.zero)
		current.Position = UDim2.fromOffset(var32.X, var32.Y)
	end, { var12, var13 })
	local var24 = reactModule.useCallback(function(p5) --[[ line: 72 ]]
		-- upvalues: var19 (ref), var23 (ref)
		var19.current = p5
		var23()
	end, { var23 })
	local var25 = reactModule.useCallback(function(p6) --[[ line: 77 ]]
		-- upvalues: var21 (ref)
		var21({ type = "overflow", page = p6 })
	end, {})
	local var26 = reactModule.useCallback(function() --[[ line: 84 ]]
		-- upvalues: var21 (ref)
		var21({ type = "agents" })
	end, {})
	local var27 = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function() --[[ line: 93 ]]
		-- upvalues: var21 (ref)
		var21({ type = "asset-library" })
	end, {}) else nil
	local var28 = reactModule.useCallback(function() --[[ line: 100 ]]
		-- upvalues: var21 (ref)
		var21({ type = "invitePicker" })
	end, {})
	local var29 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: var21 (ref)
		var21({ type = "playtestManagement" })
	end, {})
	local var30 = reactModule.useCallback(function() --[[ line: 112 ]]
		-- upvalues: var21 (ref)
		var21({ type = "creator-credit" })
	end, {})
	local var31 = reactModule.useCallback(function() --[[ line: 118 ]]
		-- upvalues: var21 (ref)
		var21(nil)
	end, {})
	
	if fFlagBuildDesktopReadinessModule then
		reactModule.useLayoutEffect(function() --[[ line: 123 ]]
			-- upvalues: var22 (write)
			if var22 == nil then
				return
			end
			local clipsDescendants = var22.ClipsDescendants
			var22.ClipsDescendants = false
			
			return function() --[[ line: 132 ]]
				-- upvalues: var22 (copy), clipsDescendants (ref)
				var22.ClipsDescendants = clipsDescendants
			end
		end, { var22 })
	end
	reactModule.useLayoutEffect(function() --[[ line: 139 ]]
		-- upvalues: fFlagBuildDesktopReadinessModule (copy), var22 (write), var12 (ref), var13 (ref), var23 (ref)
		if fFlagBuildDesktopReadinessModule and var22 ~= nil then return end
		if var12 == nil or var13 == nil then
			return
		end
		var23()
		local var33 = var12:GetPropertyChangedSignal("AbsolutePosition"):Connect(var23)
		local var34 = if var13:IsA("GuiObject") then var13:GetPropertyChangedSignal("AbsolutePosition"):Connect(var23) else nil
		
		return function() --[[ line: 155 ]]
			-- upvalues: var33 (ref), var34 (ref)
			var33:Disconnect()
			
			if var34 ~= nil then
				var34:Disconnect()
			end
		end
	end, {
		if fFlagBuildDesktopReadinessModule then var22 else nil,
		var12,
		var13,
		var23
	})
	
	if var12 == nil or var13 == nil then
		return nil
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, {
		StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var14 }),
		Container = reactModule.createElement(view, {
			ZIndex = 999,
			tag = "auto-xy",
			testId = "build-pill-menu-overlay-container",
			AnchorPoint = if fFlagBuildDesktopReadinessModule and var22 ~= nil then Vector2.new(1, 0) else var12.AnchorPoint,
			Position = if fFlagBuildDesktopReadinessModule and var22 ~= nil then UDim2.fromOffset(-var15.Padding.Large, 0) else nil,
			ref = if fFlagBuildDesktopReadinessModule and var22 ~= nil then nil else var24
		}, {
			Pill = reactModule.createElement(buildPillMenuModule, {
				target = p4.target,
				testId = p4.testId,
				onOpenPage = var25,
				onOpenInvitePicker = var28,
				onOpenAgentsPage = var26,
				onOpenAssetLibraryPage = var27,
				onOpenCreatorCreditPage = var30
			})
		})
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactRobloxModule.createPortal(createElement, if fFlagBuildDesktopReadinessModule and var22 ~= nil then var22 else var13),
		Page = reactModule.createElement(buildPillMenuPageHostModule, {
			activePage = var20,
			target = p4.target,
			onClose = var31,
			onInvitesSent = var29,
			onOpenInvitePicker = var28
		})
	})
end)