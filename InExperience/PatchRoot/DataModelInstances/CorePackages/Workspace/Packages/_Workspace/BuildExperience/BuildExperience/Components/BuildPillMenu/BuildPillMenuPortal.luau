local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local displayModule = require(parent.Display)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signalsReactModule = require(parent.SignalsReact)
local buildPillMenuModule = require(script.Parent.BuildPillMenu)
local buildPillMenuPageHostModule = require(script.Parent.BuildPillMenuPageHost)
local getBuildPillMenuPortalStoreModule = require(buildExperience.Stores.GetBuildPillMenuPortalStore)
local fFlagBuildPublishNavigationSheetModule = require(buildExperience.Flags.FFlagBuildPublishNavigationSheet)
local var1 = if fFlagBuildPublishNavigationSheetModule then require(buildExperience.Components.PublishSheet.PublishSheetController) else nil
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
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), signalsReactModule (ref), useOverlay (ref), useStyleSheet (ref), useTokens (ref), displayModule (ref), reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), view (ref), buildPillMenuModule (ref), reactRobloxModule (ref), buildPillMenuPageHostModule (ref), var1 (ref)
	local var2 = signalsReactModule.useSignalState(getBuildPillMenuPortalStoreModule().getPortalTarget)
	local var3 = useOverlay()
	local var4 = useStyleSheet()
	local var5 = useTokens()
	local displayStore = displayModule.GetDisplayStore(false)
	local var6 = signalsReactModule.useSignalState(displayStore.getDisplaySize)
	local var7 = signalsReactModule.useSignalState(displayStore.getViewportSize)
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(false)
	local var13 = if not (p1.sheet == nil or not (if var6 == Enum.DisplaySize.Small then var7.Y < var7.X else true)) then p1.sheet else nil
	local var14 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var2 (ref), var3 (ref)
		local current = var8.current
		
		if var2 == nil or var3 == nil or current == nil then
			return
		end
		local var15 = var2.AbsolutePosition - (if var3:IsA("GuiObject") then var3.AbsolutePosition else Vector2.zero)
		current.Position = UDim2.fromOffset(var15.X, var15.Y)
	end, { var2, var3 })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var14 (ref)
		var8.current = p2
		var14()
	end, { var14 })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var12 (ref), var10 (ref)
		if fFlagBuildPublishNavigationSheetModule and p2 == "publish" then
			var12(true)
			
			return
		end
		var10({ type = "overflow", page = p2 })
	end, {})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10({ type = "agents" })
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10({ type = "invitePicker" })
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10({ type = "playtestManagement" })
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10({ type = "creator-credit" })
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(nil)
	end, {})
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var21 (ref), p1 (ref)
		var21()
		
		if p1.onOpenChat ~= nil then
			p1.onOpenChat(p2)
		end
	end, { var21, p1.onOpenChat })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, {})
	local var24 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var10 (ref)
		var10({
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
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (write)
		if var13 == nil then
			return
		end
		local clipsDescendants = var13.ClipsDescendants
		var13.ClipsDescendants = false
		
		return function()
			-- upvalues: var13 (copy), clipsDescendants (ref)
			var13.ClipsDescendants = clipsDescendants
		end
	end, { var13 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (write), var2 (ref), var3 (ref), var14 (ref)
		if var13 ~= nil then return end
		if var2 == nil or var3 == nil then
			return
		end
		var14()
		local var25 = var2:GetPropertyChangedSignal("AbsolutePosition"):Connect(var14)
		local var26 = if var3:IsA("GuiObject") then var3:GetPropertyChangedSignal("AbsolutePosition"):Connect(var14) else nil
		
		return function()
			-- upvalues: var25 (ref), var26 (ref)
			var25:Disconnect()
			
			if var26 ~= nil then
				var26:Disconnect()
			end
		end
	end, { var13, var2, var3, var14 })
	
	return if var2 == nil or var3 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactRobloxModule.createPortal(reactModule.createElement(reactModule.Fragment, nil, {
			StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var4 }),
			Container = reactModule.createElement(view, {
				ZIndex = 999,
				tag = "auto-xy",
				testId = "build-pill-menu-overlay-container",
				AnchorPoint = if var13 ~= nil then var2.AnchorPoint else Vector2.new(1, 0),
				Position = if var13 ~= nil then nil else UDim2.fromOffset(-var5.Padding.Large, 0),
				ref = if var13 ~= nil then var15 else nil
			}, {
				Pill = reactModule.createElement(buildPillMenuModule, {
					target = p1.target,
					testId = p1.testId,
					onOpenPage = var16,
					onOpenInvitePicker = var18,
					onOpenPlaytestManagement = var19,
					onOpenAgentsPage = var17,
					onOpenCreatorCreditPage = var20
				})
			})
		}), if var13 ~= nil then var3 else var13),
		Page = reactModule.createElement(buildPillMenuPageHostModule, {
			activePage = var9,
			target = p1.target,
			onClose = var21,
			onOpenChat = var22,
			onInvitesSent = var19,
			onOpenInvitePicker = var18
		}),
		PublishSheet = if fFlagBuildPublishNavigationSheetModule then reactModule.createElement(var1, {
			showPreviewButton = false,
			isOpen = var11,
			target = p1.target,
			onClose = var23,
			navigateToSubPage = var24
		}) else nil
	})
end)