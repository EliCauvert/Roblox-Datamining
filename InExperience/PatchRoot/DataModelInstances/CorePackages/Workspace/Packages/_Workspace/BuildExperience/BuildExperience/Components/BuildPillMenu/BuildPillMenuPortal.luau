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
local fFlagBuildPublishNavigationSheetModule = require(buildExperience.Flags.FFlagBuildPublishNavigationSheet)
local var2 = if fFlagBuildPublishNavigationSheetModule then require(buildExperience.Components.PublishSheet.PublishSheetController) else nil
local view = foundationModule.View
local useOverlay = foundationModule.Hooks.useOverlay
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useTokens = foundationModule.Hooks.useTokens

local function _(p1, p2)
	return if p1 == Enum.DisplaySize.Small then p2.Y < p2.X else true
end

local _ = function(p1, p2)
	local var3 = p1.AbsolutePosition - (if p2:IsA("GuiObject") then p2.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(var3.X, var3.Y)
end

return reactModule.memo(function(p1)
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), signalsReactModule (ref), useOverlay (ref), useStyleSheet (ref), fFlagBuildDesktopReadinessModule (ref), useTokens (ref), var1 (ref), reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), view (ref), buildPillMenuModule (ref), reactRobloxModule (ref), buildPillMenuPageHostModule (ref), var2 (ref)
	local var3 = signalsReactModule.useSignalState(getBuildPillMenuPortalStoreModule().getPortalTarget)
	local var4 = useOverlay()
	local var5 = useStyleSheet()
	local var6 = if fFlagBuildDesktopReadinessModule then useTokens() else nil
	local var7 = if fFlagBuildDesktopReadinessModule then var1.GetDisplayStore(false) else nil
	local var8 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var7.getDisplaySize) else nil
	local var9 = if fFlagBuildDesktopReadinessModule then signalsReactModule.useSignalState(var7.getViewportSize) else nil
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13, var14 = reactModule.useState(false)
	local var15 = if fFlagBuildDesktopReadinessModule and p1.sheet ~= nil and (if var8 == Enum.DisplaySize.Small then var9.Y < var9.X else true) then p1.sheet else nil
	local var16 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var3 (ref), var4 (ref)
		local current = var10.current
		
		if var3 == nil or var4 == nil or current == nil then
			return
		end
		local var17 = var3.AbsolutePosition - (if var4:IsA("GuiObject") then var4.AbsolutePosition else Vector2.zero)
		current.Position = UDim2.fromOffset(var17.X, var17.Y)
	end, { var3, var4 })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var16 (ref)
		var10.current = p2
		var16()
	end, { var16 })
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var14 (ref), var12 (ref)
		if fFlagBuildPublishNavigationSheetModule and p2 == "publish" then
			var14(true)
			
			return
		end
		var12({ type = "overflow", page = p2 })
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12({ type = "agents" })
	end, {})
	local var20 = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12({ type = "asset-library" })
	end, {}) else nil
	local var21 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12({ type = "invitePicker" })
	end, {})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12({ type = "playtestManagement" })
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12({ type = "creator-credit" })
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(nil)
	end, {})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var24 (ref), p1 (ref)
		var24()
		
		if p1.onOpenChat ~= nil then
			p1.onOpenChat(p2)
		end
	end, { var24, p1.onOpenChat })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var14 (ref)
		var14(false)
	end, {})
	local var27 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var12 (ref)
		var12({
			type = "screen",
			screen = p2,
			target = {
				universeId = p3.universeId,
				placeId = p3.placeId,
				sessionId = p3.sessionId,
				isNewGameTarget = p3.isNewGameTarget or false
			}
		})
	end, {})
	
	if fFlagBuildDesktopReadinessModule then
		reactModule.useLayoutEffect(function()
			-- upvalues: var15 (write)
			if var15 == nil then
				return
			end
			local clipsDescendants = var15.ClipsDescendants
			var15.ClipsDescendants = false
			
			return function()
				-- upvalues: var15 (copy), clipsDescendants (ref)
				var15.ClipsDescendants = clipsDescendants
			end
		end, { var15 })
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagBuildDesktopReadinessModule (copy), var15 (write), var3 (ref), var4 (ref), var16 (ref)
		if fFlagBuildDesktopReadinessModule and var15 ~= nil then return end
		if var3 == nil or var4 == nil then
			return
		end
		var16()
		local var28 = var3:GetPropertyChangedSignal("AbsolutePosition"):Connect(var16)
		local var29 = if var4:IsA("GuiObject") then var4:GetPropertyChangedSignal("AbsolutePosition"):Connect(var16) else nil
		
		return function()
			-- upvalues: var28 (ref), var29 (ref)
			var28:Disconnect()
			
			if var29 ~= nil then
				var29:Disconnect()
			end
		end
	end, {
		if fFlagBuildDesktopReadinessModule then var15 else nil,
		var3,
		var4,
		var16
	})
	
	if var3 == nil or var4 == nil then
		return nil
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, {
		StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var5 }),
		Container = reactModule.createElement(view, {
			ZIndex = 999,
			tag = "auto-xy",
			testId = "build-pill-menu-overlay-container",
			AnchorPoint = if fFlagBuildDesktopReadinessModule and var15 ~= nil then Vector2.new(1, 0) else var3.AnchorPoint,
			Position = if fFlagBuildDesktopReadinessModule and var15 ~= nil then UDim2.fromOffset(-var6.Padding.Large, 0) else nil,
			ref = if fFlagBuildDesktopReadinessModule and var15 ~= nil then nil else var17
		}, {
			Pill = reactModule.createElement(buildPillMenuModule, {
				target = p1.target,
				testId = p1.testId,
				onOpenPage = var18,
				onOpenInvitePicker = var21,
				onOpenAgentsPage = var19,
				onOpenAssetLibraryPage = var20,
				onOpenCreatorCreditPage = var23
			})
		})
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactRobloxModule.createPortal(createElement, if fFlagBuildDesktopReadinessModule and var15 ~= nil then var15 else var4),
		Page = reactModule.createElement(buildPillMenuPageHostModule, {
			activePage = var11,
			target = p1.target,
			onClose = var24,
			onOpenChat = var25,
			onInvitesSent = var22,
			onOpenInvitePicker = var21
		}),
		PublishSheet = if fFlagBuildPublishNavigationSheetModule then reactModule.createElement(var2, {
			showPreviewButton = false,
			isOpen = var13,
			target = p1.target,
			onClose = var26,
			navigateToSubPage = var27
		}) else nil
	})
end)