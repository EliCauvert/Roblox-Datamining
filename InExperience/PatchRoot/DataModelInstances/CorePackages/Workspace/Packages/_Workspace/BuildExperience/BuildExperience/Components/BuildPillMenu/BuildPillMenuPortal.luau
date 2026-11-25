local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local DisplayModule = require(Parent.Display)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SignalsReactModule = require(Parent.SignalsReact)
local BuildPillMenuModule = require(script.Parent.BuildPillMenu)
local BuildPillMenuPageHostModule = require(script.Parent.BuildPillMenuPageHost)
local GetBuildPillMenuPortalStoreModule = require(BuildExperience.Stores.GetBuildPillMenuPortalStore)
local FFlagBuildPublishNavigationSheetModule = require(BuildExperience.Flags.FFlagBuildPublishNavigationSheet)
local PublishSheetControllerModule = if FFlagBuildPublishNavigationSheetModule then require(BuildExperience.Components.PublishSheet.PublishSheetController) else nil
local View = FoundationModule.View
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(DisplaySize, Vector): boolean
	return DisplaySize ~= Enum.DisplaySize.Small or Vector.Y < Vector.X
end

local _ = function(Frame, Frame1: Frame): UDim2
	local AbsolutePositionDelta = Frame.AbsolutePosition - (if Frame1:IsA("GuiObject") then Frame1.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(AbsolutePositionDelta.X, AbsolutePositionDelta.Y)
end

return ReactModule.memo(function(p1)
	-- upvalues: GetBuildPillMenuPortalStoreModule (copy), SignalsReactModule (copy), UseOverlayFunction (copy), UseStyleSheetFunction (copy), UseTokensFunction (copy), DisplayModule (copy), ReactModule (copy), FFlagBuildPublishNavigationSheetModule (copy), View (copy), BuildPillMenuModule (copy), ReactRobloxModule (copy), BuildPillMenuPageHostModule (copy), PublishSheetControllerModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetBuildPillMenuPortalStoreModule().getPortalTarget)
	local UseOverlayResult = UseOverlayFunction()
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseTokensResult = UseTokensFunction()
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(DisplayStore.getDisplaySize)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(DisplayStore.getViewportSize)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Sheet = nil
	
	if p1.sheet ~= nil and (UseSignalStateResult1 ~= Enum.DisplaySize.Small or UseSignalStateResult2.X > UseSignalStateResult2.Y) then
		Sheet = p1.sheet
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy), UseOverlayResult (copy)
		local Current = UseRefResult.current
		
		if UseSignalStateResult ~= nil and UseOverlayResult ~= nil and Current ~= nil then
			local AbsolutePositionDelta = UseSignalStateResult.AbsolutePosition - (if UseOverlayResult:IsA("GuiObject") then UseOverlayResult.AbsolutePosition else Vector2.zero)
			Current.Position = UDim2.fromOffset(AbsolutePositionDelta.X, AbsolutePositionDelta.Y)
			
			return
		end
	end, { UseSignalStateResult, UseOverlayResult })
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = Current
		UseResult()
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(Page)
		-- upvalues: FFlagBuildPublishNavigationSheetModule (upval), UseStateResult2_1 (copy), UseStateResult2 (copy)
		if FFlagBuildPublishNavigationSheetModule and Page == "publish" then
			UseStateResult2_1(true)
			
			return
		else
			UseStateResult2({ type = "overflow", page = Page })
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({ type = "agents" })
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({ type = "invitePicker" })
	end, {})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({ type = "playtestManagement" })
	end, {})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({ type = "creator-credit" })
	end, {})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	local UseResult8 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult7 (copy), p1 (copy)
		UseResult7()
		
		if p1.onOpenChat ~= nil then
			p1.onOpenChat(p2)
		end
	end, { UseResult7, p1.onOpenChat })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseResult10 = ReactModule.useCallback(function(Screen, p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({
			type = "screen",
			screen = Screen,
			target = {
				universeId = p2.universeId,
				placeId = p2.placeId,
				sessionId = p2.sessionId,
				isNewGameTarget = p2.isNewGameTarget or false
			}
		})
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: Sheet (ref)
		if Sheet == nil then return end
		local ClipsDescendants = Sheet.ClipsDescendants
		Sheet.ClipsDescendants = false
		
		return function()
			-- upvalues: Sheet (upval), ClipsDescendants (copy)
			Sheet.ClipsDescendants = ClipsDescendants
		end
	end, { Sheet })
	ReactModule.useLayoutEffect(function()
		-- upvalues: Sheet (ref), UseSignalStateResult (copy), UseOverlayResult (copy), UseResult (copy)
		if Sheet ~= nil then return end
		if UseSignalStateResult == nil or UseOverlayResult == nil then return end
		UseResult()
		local Connection = UseSignalStateResult:GetPropertyChangedSignal("AbsolutePosition"):Connect(UseResult)
		local Connection1 = if UseOverlayResult:IsA("GuiObject") then UseOverlayResult:GetPropertyChangedSignal("AbsolutePosition"):Connect(UseResult) else nil
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			
			if Connection1 ~= nil then
				Connection1:Disconnect()
			end
		end
	end, { Sheet, UseSignalStateResult, UseOverlayResult, UseResult })
	
	return if UseSignalStateResult == nil or UseOverlayResult == nil then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
		Pill = ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, {
			StyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
			Container = ReactModule.createElement(View, {
				ZIndex = 999,
				tag = "auto-xy",
				testId = "build-pill-menu-overlay-container",
				AnchorPoint = if Sheet == nil then UseSignalStateResult.AnchorPoint else Vector2.new(1, 0),
				Position = if Sheet == nil then nil else UDim2.fromOffset(-UseTokensResult.Padding.Large, 0),
				ref = if Sheet == nil then UseResult1 else nil
			}, {
				Pill = ReactModule.createElement(BuildPillMenuModule, {
					target = p1.target,
					testId = p1.testId,
					onOpenPage = UseResult2,
					onOpenInvitePicker = UseResult4,
					onOpenPlaytestManagement = UseResult5,
					onOpenAgentsPage = UseResult3,
					onOpenCreatorCreditPage = UseResult6
				})
			})
		}), if Sheet == nil then UseOverlayResult else Sheet),
		Page = ReactModule.createElement(BuildPillMenuPageHostModule, {
			activePage = UseStateResult,
			target = p1.target,
			onClose = UseResult7,
			onOpenChat = UseResult8,
			onInvitesSent = UseResult5,
			onOpenInvitePicker = UseResult4
		}),
		PublishSheet = if FFlagBuildPublishNavigationSheetModule then ReactModule.createElement(PublishSheetControllerModule, {
			showPreviewButton = false,
			isOpen = UseStateResult1,
			target = p1.target,
			onClose = UseResult9,
			navigateToSubPage = UseResult10
		}) else nil
	})
end)