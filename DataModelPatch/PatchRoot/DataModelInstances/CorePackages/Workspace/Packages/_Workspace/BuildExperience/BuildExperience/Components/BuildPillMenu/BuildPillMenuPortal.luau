local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SignalsReactModule = require(Parent.SignalsReact)
local BuildPillMenuModule = require(script.Parent.BuildPillMenu)
local BuildPillMenuPageHostModule = require(script.Parent.BuildPillMenuPageHost)
local GetBuildPillMenuPortalStoreModule = require(BuildExperience.Stores.GetBuildPillMenuPortalStore)
local View = FoundationModule.View
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

local function _(Frame, Frame1: Frame): UDim2
	local AbsolutePositionDelta = Frame.AbsolutePosition - (if Frame1:IsA("GuiObject") then Frame1.AbsolutePosition else Vector2.zero)
	
	return UDim2.fromOffset(AbsolutePositionDelta.X, AbsolutePositionDelta.Y)
end

return ReactModule.memo(function(p1)
	-- upvalues: GetBuildPillMenuPortalStoreModule (copy), SignalsReactModule (copy), UseOverlayFunction (copy), UseStyleSheetFunction (copy), ReactModule (copy), View (copy), BuildPillMenuModule (copy), ReactRobloxModule (copy), BuildPillMenuPageHostModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetBuildPillMenuPortalStoreModule().getPortalTarget)
	local UseOverlayResult = UseOverlayFunction()
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
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
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({ type = "overflow", page = Page })
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({ type = "agents" })
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseOverlayResult (copy), UseResult (copy)
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
	end, { UseSignalStateResult, UseOverlayResult, UseResult })
	
	return if UseSignalStateResult == nil or UseOverlayResult == nil then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
		Pill = ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, {
			StyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
			Container = ReactModule.createElement(View, {
				ZIndex = 999,
				tag = "auto-xy",
				testId = "build-pill-menu-overlay-container",
				AnchorPoint = UseSignalStateResult.AnchorPoint,
				ref = UseResult1
			}, {
				Pill = ReactModule.createElement(BuildPillMenuModule, {
					target = p1.target,
					testId = p1.testId,
					onOpenPage = UseResult2,
					onOpenAgentsPage = UseResult3
				})
			})
		}), UseOverlayResult),
		Page = ReactModule.createElement(BuildPillMenuPageHostModule, {
			activePage = UseStateResult,
			target = p1.target,
			onClose = UseResult4
		})
	})
end)