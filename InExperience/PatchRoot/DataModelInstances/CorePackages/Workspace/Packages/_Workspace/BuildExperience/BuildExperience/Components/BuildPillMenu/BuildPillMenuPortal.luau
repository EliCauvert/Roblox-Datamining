local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
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

local function _(p0, p1) --[[ line: 27 | named "getOverlayPosition" ]]
	local var8 = p0.AbsolutePosition - (if p1:IsA("GuiObject") then p1.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(var8.X, var8.Y)
end

return reactModule.memo(function(p2) --[[ line: 34 | named "BuildPillMenuPortal" ]]
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), signalsReactModule (ref), useOverlay (ref), useStyleSheet (ref), reactModule (ref), view (ref), buildPillMenuModule (ref), reactRobloxModule (ref), buildPillMenuPageHostModule (ref)
	local var9 = signalsReactModule.useSignalState(getBuildPillMenuPortalStoreModule().getPortalTarget)
	local var10 = useOverlay()
	local var11 = useStyleSheet()
	local var12 = reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var12 (ref), var9 (ref), var10 (ref)
		local current = var12.current
		
		if var9 == nil or var10 == nil or current == nil then
			return
		end
		local var23 = var9.AbsolutePosition - (if var10:IsA("GuiObject") then var10.AbsolutePosition else Vector2.zero)
		current.Position = UDim2.fromOffset(var23.X, var23.Y)
	end, { var9, var10 })
	local var16 = reactModule.useCallback(function(p3) --[[ line: 51 ]]
		-- upvalues: var12 (ref), var15 (ref)
		var12.current = p3
		var15()
	end, { var15 })
	local var17 = reactModule.useCallback(function(p4) --[[ line: 56 ]]
		-- upvalues: var14 (ref)
		var14({ type = "overflow", page = p4 })
	end, {})
	local var18 = reactModule.useCallback(function() --[[ line: 63 ]]
		-- upvalues: var14 (ref)
		var14({ type = "agents" })
	end, {})
	local var19 = reactModule.useCallback(function() --[[ line: 69 ]]
		-- upvalues: var14 (ref)
		var14({ type = "invitePicker" })
	end, {})
	local var20 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: var14 (ref)
		var14({ type = "playtestManagement" })
	end, {})
	local var21 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: var14 (ref)
		var14({ type = "creator-credit" })
	end, {})
	local var22 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: var14 (ref)
		var14(nil)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 91 ]]
		-- upvalues: var9 (ref), var10 (ref), var15 (ref)
		if var9 == nil or var10 == nil then
			return
		end
		var15()
		local var24 = var9:GetPropertyChangedSignal("AbsolutePosition"):Connect(var15)
		local var25 = if var10:IsA("GuiObject") then var10:GetPropertyChangedSignal("AbsolutePosition"):Connect(var15) else nil
		
		return function() --[[ line: 104 ]]
			-- upvalues: var24 (ref), var25 (ref)
			var24:Disconnect()
			
			if var25 ~= nil then
				var25:Disconnect()
			end
		end
	end, { var9, var10, var15 })
	
	return if var9 == nil or var10 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactRobloxModule.createPortal(reactModule.createElement(reactModule.Fragment, nil, {
			StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var11 }),
			Container = reactModule.createElement(view, {
				ZIndex = 999,
				tag = "auto-xy",
				testId = "build-pill-menu-overlay-container",
				AnchorPoint = var9.AnchorPoint,
				ref = var16
			}, {
				Pill = reactModule.createElement(buildPillMenuModule, {
					target = p2.target,
					testId = p2.testId,
					onOpenPage = var17,
					onOpenInvitePicker = var19,
					onOpenAgentsPage = var18,
					onOpenCreatorCreditPage = var21
				})
			})
		}), var10),
		Page = reactModule.createElement(buildPillMenuPageHostModule, {
			activePage = var13,
			target = p2.target,
			onClose = var22,
			onInvitesSent = var20,
			onOpenInvitePicker = var19
		})
	})
end)