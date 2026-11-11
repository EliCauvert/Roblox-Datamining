local Parent = script:FindFirstAncestor("LoginV2").Parent
local HttpService = game:GetService("HttpService")
local AccountService = game:GetService("AccountService")
local MagicLoginEngineFeature = game:GetEngineFeature("MagicLogin")
local ReactModule = require(Parent.React)
local ConstantsModule = require(script.Parent.Constants)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local PeekView = require(Parent.PeekView).PeekView
local PeekViewState = require(Parent.PeekView).PeekViewState
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local DashModule = require(Parent.Dash)
local ScrollingListTable = UIBloxModule.App.Table.ScrollingListTable
local Cell = UIBloxModule.App.Table.Cell
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local Logger = require(Parent.Loggers).Logger
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect

local function addDevice(List, p1)
	local List1 = {}
	
	for i, value in ipairs(List) do
		List1[i] = {
			endpointId = value.endpointId,
			endpointName = value.endpointName,
			endpointType = value.endpointType
		}
	end
	table.insert(List1, {
		endpointId = p1.endpointId,
		endpointName = p1.endpointName,
		endpointType = p1.endpointType
	})
	
	return List1
end

local function removeDevice(List, EndpointId)
	local List1 = {}
	
	for _, value in ipairs(List) do
		if EndpointId ~= value.endpointId then
			table.insert(List1, {
				endpointId = value.endpointId,
				endpointName = value.endpointName,
				endpointType = value.endpointType
			})
		end
	end
	return List1
end

return function(p2)
	-- upvalues: UseDispatchFunction (copy), UseStateFunction (copy), PeekViewState (copy), UseStyleFunction (copy), ReactModule (copy), UseEffectFunction (copy), AccountService (copy), MagicLoginEngineFeature (copy), HttpService (copy), ConstantsModule (copy), addDevice (copy), removeDevice (copy), Logger (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), Cell (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), PeekView (copy), ScrollingListTable (copy), DashModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(PeekViewState.Full)
	local UseStyleResult = UseStyleFunction()
	local MagicLoginEventConnection = nil
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	UseEffectFunction(function()
		-- upvalues: AccountService (upval), MagicLoginEngineFeature (upval), MagicLoginEventConnection (ref), HttpService (upval), ConstantsModule (upval), UseStateResult2_1 (copy), addDevice (upval), removeDevice (upval), Logger (upval)
		if AccountService and MagicLoginEngineFeature then
			MagicLoginEventConnection = AccountService.MagicLoginEvent:Connect(function(Text)
				-- upvalues: HttpService (upval), ConstantsModule (upval), UseStateResult2_1 (upval), addDevice (upval), removeDevice (upval), Logger (upval)
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
				
				if not Success then
					Logger:warning("Magic login Failed to parse JSON data from string: " .. Text)
				elseif Result.magicLoginActionKey == ConstantsModule.ENDPOINT_FOUND then
					UseStateResult2_1(function(p3)
						-- upvalues: addDevice (upval), Result (copy)
						return (addDevice(p3, {
							endpointId = Result.endpointId,
							endpointName = Result.endpointName,
							endpointType = Result.endpointType
						}))
					end)
					
					return
				else
					if Result.magicLoginActionKey == ConstantsModule.ENDPOINT_LOST then
						UseStateResult2_1(function(p3)
							-- upvalues: removeDevice (upval), Result (copy)
							return (removeDevice(p3, Result.endpointId))
						end)
						
						return
					end
					if Result.magicLoginActionKey == ConstantsModule.CLEAR_DEVICE_LIST then
						UseStateResult2_1({})
						
						return
					end
				end
			end)
			AccountService:MagicLogin(ConstantsModule.START_DISCOVERY)
		end
		return function()
			-- upvalues: AccountService (upval), MagicLoginEngineFeature (upval), MagicLoginEventConnection (upval), ConstantsModule (upval)
			if AccountService and MagicLoginEngineFeature then
				if MagicLoginEventConnection then
					MagicLoginEventConnection:Disconnect()
				end
				AccountService:MagicLogin(ConstantsModule.STOP_DISCOVERY)
			end
		end
	end, {})
	
	local function _(p3)
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p2 (copy)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.MagicLoginRequestPopup, {
			endpointId = p3.endpointId,
			endpointName = p3.endpointName,
			endpointType = p3.endpointType,
			launchApp = p2.launchApp
		}))
	end
	
	return ReactModule.createElement(View, { tag = "size-full bg-action-alert" }, {
		PeekView = ReactModule.createElement(PeekView, {
			hasScrim = true,
			peekHeaderClose = false,
			canDragFullViewToBrief = true,
			mountAnimation = true,
			returnToFullView = true,
			thumbstickScrollEnabled = true,
			showDraggerInClosedState = true,
			isScrollingEnabled = true,
			showDropShadow = true,
			briefViewContentHeight = UDim.new(0, 270),
			superBriefViewContentHeight = UDim.new(0, 40),
			style = UseStyleResult,
			stateOnMount = PeekViewState.Brief,
			peekHeaderPositionYChange = function(p3: number)
				-- upvalues: UseStateResult2 (copy), PeekViewState (upval)
				if p3 < 10 then
					UseStateResult2(PeekViewState.Closed)
				end
			end,
			viewStateChanged = function(Closed, _)
				-- upvalues: UseStateResult2 (copy), PeekViewState (upval), p2 (copy), UseDispatchResult (copy)
				UseStateResult2(Closed)
				
				if (Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden) and p2.closeCentralOverlayThunk then
					UseDispatchResult(p2.closeCentralOverlayThunk())
				end
			end,
			peekViewState = UseStateResult
		}, {
			PeekViewContent = ReactModule.createElement(View, { tag = "col gap-small auto-y size-full-0 padding-xxlarge" }, {
				TitleText = ReactModule.createElement(Text, {
					Text = "Nearby Devices",
					tag = "auto-xy text-heading-medium text-wrap text-align-x-left",
					LayoutOrder = 0
				}),
				Body = ReactModule.createElement(View, { tag = "size-full", LayoutOrder = 1 }, {
					VisibilityText = ReactModule.createElement(Text, { Text = "", tag = "size-full text-body" }),
					DeviceList = ReactModule.createElement(ScrollingListTable, {
						cells = DashModule.map(UseStateResult1, function(p3)
							-- upvalues: ReactModule (upval), Cell (upval), View (upval), Text (upval), Button (upval), ButtonVariant (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p2 (copy), InputSize (upval), UseStyleResult (copy)
							return ReactModule.createElement(Cell, {
								onActivated = nil,
								horizontalPadding = 0,
								size = UDim2.new(1, 0, 0, 60),
								head = ReactModule.createElement(View, { tag = "col gap-xxsmall auto-xy" }, {
									nameText = ReactModule.createElement(Text, {
										tag = "auto-xy text-title-medium text-wrap text-align-x-left",
										LayoutOrder = 0,
										Text = p3.endpointName or "Unknown"
									}),
									endpointTypeText = ReactModule.createElement(Text, {
										tag = "auto-xy text-body-medium text-wrap text-align-x-left",
										LayoutOrder = 1,
										Text = p3.endpointType or "Unknown"
									})
								}),
								tail = ReactModule.createElement(Button, {
									text = "Request",
									isDisabled = false,
									LayoutOrder = 0,
									variant = ButtonVariant.Standard,
									onActivated = function()
										-- upvalues: p3 (copy), UseDispatchResult (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), p2 (upval)
										UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.MagicLoginRequestPopup, {
											endpointId = p3.endpointId,
											endpointName = p3.endpointName,
											endpointType = p3.endpointType,
											launchApp = p2.launchApp
										}))
									end,
									size = InputSize.Small,
									width = UDim.new(0, 80)
								}),
								background = ReactModule.createElement("Frame", {
									BackgroundTransparency = 1,
									Size = UDim2.fromScale(1, 1),
									BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
									BorderColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color
								})
							})
						end)
					})
				})
			})
		})
	})
end