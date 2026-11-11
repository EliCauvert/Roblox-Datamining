local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local GetFFlagEnableContinueRecoveryFunction = require(Parent.SharedFlags).GetFFlagEnableContinueRecovery
local Logger = require(Parent.Loggers).Logger
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local RecoverySessionMetadataModule = require(AccountRecovery.Thunks.RecoverySessionMetadata)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local ProfileListItemModule = require(AccountRecovery.Components.ProfileListItem)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local EventServiceModule = require(AccountRecovery.Analytics.EventService)
local ConstantsModule = require(AccountRecovery.Components.Constants)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseClearFocusOnUnmountFunction (copy), RecoverySessionMetadataModule (copy), Logger (copy), HttpService (copy), AccountRecoveryPageStateModule (copy), GetFFlagEnableContinueRecoveryFunction (copy), ProfileListItemModule (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), Loading (copy), IconSize (copy), Text (copy), ScrollView (copy), Visibility (copy), EventServiceModule (copy), ConstantsModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(Vector2.new(0, 0))
	local UserIDParam = p1.navigation.getParam("userID")
	local IsNotUserIDParamMatch: boolean = UserIDParam ~= nil and UserIDParam ~= 0
	UseClearFocusOnUnmountFunction()
	
	local function _(RecoverySessionId)
		-- upvalues: UseDispatchResult (copy), RecoverySessionMetadataModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(RecoverySessionMetadataModule(UseRoactServiceResult, { recoverySessionId = RecoverySessionId }))
	end
	
	local _ = function(p2, p3, p4, p5)
		-- upvalues: UseStateResult2_4 (copy), UseStateResult2_3 (copy), UseContextResult (copy)
		UseStateResult2_4(true)
		UseStateResult2_3("")
		UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, p2, p3, p4, p5, nil, nil, nil)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy), UseContextResult (copy), UseDispatchResult (copy), RecoverySessionMetadataModule (upval), UseRoactServiceResult (copy), Logger (upval), HttpService (upval), UseStateResult2 (copy), UseStateResult2_4 (copy), UseStateResult2_1 (copy), IsNotUserIDParamMatch (copy), p1 (copy), AccountRecoveryPageStateModule (upval), UserIDParam (copy), GetFFlagEnableContinueRecoveryFunction (upval), UseStateResult2_3 (copy)
		UseStateResult2_2(true)
		UseDispatchResult(RecoverySessionMetadataModule(UseRoactServiceResult, {
			recoverySessionId = UseContextResult.state.recoverySessionId
		})):andThen(function(Result)
			-- upvalues: Logger (upval), HttpService (upval), UseStateResult2 (upval), UseStateResult2_2 (upval), UseStateResult2_4 (upval), UseStateResult2_1 (upval), IsNotUserIDParamMatch (upval), p1 (upval), AccountRecoveryPageStateModule (upval), UserIDParam (upval), GetFFlagEnableContinueRecoveryFunction (upval), UseStateResult2_3 (upval), UseContextResult (upval)
			if Result.isError then
				Logger:warning("Error getting recovery session metadata: {}", HttpService:JSONEncode(Result))
				
				return
			end
			local function v46()
				-- upvalues: UseStateResult2 (upval), Result (copy), UseStateResult2_2 (upval), UseStateResult2_4 (upval)
				UseStateResult2(Result.data.eligibleUserIDsToRecover)
				UseStateResult2_2(false)
				UseStateResult2_4(false)
			end
			
			UseStateResult2_1(Result.data.shouldAddContactMethod)
			
			if IsNotUserIDParamMatch then
				p1.navigation.replace(AccountRecoveryPageStateModule.ResetPasswordScreen, {
					userID = UserIDParam,
					shouldAddContactMethod = Result.data.shouldAddContactMethod
				})
				
				return
			end
			if Result.data.eligibleUserIDsToRecover and #Result.data.eligibleUserIDsToRecover == 1 then
				if GetFFlagEnableContinueRecoveryFunction() then
					local EligibleUserIDsToRecoverEntry = Result.data.eligibleUserIDsToRecover[1]
					
					local function v48()
						-- upvalues: p1 (upval), AccountRecoveryPageStateModule (upval), Result (copy)
						p1.navigation.replace(AccountRecoveryPageStateModule.ResetPasswordScreen, {
							userID = Result.data.eligibleUserIDsToRecover[1],
							shouldAddContactMethod = Result.data.shouldAddContactMethod
						})
					end
					
					UseStateResult2_4(true)
					UseStateResult2_3("")
					UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, EligibleUserIDsToRecoverEntry, v48, v46, v46, nil, nil, nil)
					
					return
				else
					p1.navigation.replace(AccountRecoveryPageStateModule.ResetPasswordScreen, {
						userID = Result.data.eligibleUserIDsToRecover[1],
						shouldAddContactMethod = Result.data.shouldAddContactMethod
					})
					
					return
				end
			elseif Result.data.eligibleUserIDsToRecover then
				UseStateResult2(Result.data.eligibleUserIDsToRecover)
				UseStateResult2_2(false)
				UseStateResult2_4(false)
				
				return
			else
				Logger:warning("Eligible user IDs to recover is nil")
				UseStateResult2_2(false)
			end
		end):await()
	end, {})
	
	local function v43(List, OnProfileActivated)
		-- upvalues: ReactModule (upval), ProfileListItemModule (upval)
		if List == nil or #List == 0 then
			return nil
		end
		local Elements = {}
		
		for Index, UserId in ipairs(List) do
			Elements["Profile_" .. tostring(Index)] = ReactModule.createElement(ProfileListItemModule, {
				index = Index,
				userId = UserId,
				onProfileActivated = OnProfileActivated
			})
		end
		return Elements
	end
	
	local function v44(Frame: Frame)
		-- upvalues: UseStateResult6 (copy), UseStateResult2_5 (copy)
		if UseStateResult6 ~= Frame.AbsoluteSize then
			UseStateResult2_5(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		resetPasswordHeadingText = "Authentication.AccountRecovery.Heading.ResetPassword",
		chooseAccountText = "Authentication.AccountRecovery.Description.ChooseAccount",
		requestErrorText = if UseStateResult4 == "" then nil else UseStateResult4
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			Header = ReactModule.createElement(RecoveryHeaderModule, {
				LayoutOrder = 1,
				currentComponent = "chooseAccount",
				onBackActivated = function()
					-- upvalues: p1 (copy)
					p1.navigation.goBack()
				end,
				backButtonDisabled = UseStateResult5 or UseStateResult3,
				recoveryHeadingText = UseLocalizationResult.resetPasswordHeadingText,
				recoverySessionId = UseContextResult.state.recoverySessionId
			}),
			Loading = UseStateResult3 and ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				LoadingIcon = ReactModule.createElement(Loading, { size = IconSize.Medium })
			}),
			Content = not UseStateResult3 and ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				PreScrollContent = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					[ReactModule.Change.AbsoluteSize] = v44
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
						PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
					}),
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
					}),
					HeaderSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_400)
					}),
					BodyText = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						TextWrapped = true,
						Text = UseLocalizationResult.chooseAccountText,
						fontStyle = UseTokensResult.Typography.BodyMedium,
						textStyle = UseTokensResult.Color.Content.Default,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}),
					BodyTextSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_300)
					}),
					RequestErrorTextLabel = UseStateResult4 ~= "" and ReactModule.createElement(Text, {
						LayoutOrder = 4,
						Text = UseLocalizationResult.requestErrorText or "",
						fontStyle = UseTokensResult.Typography.CaptionSmall,
						textStyle = UseTokensResult.Color.System.Alert,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						padding = { bottom = UDim.new(0, UseTokensResult.Size.Size_300) }
					})
				}),
				AccountListScrollView = ReactModule.createElement(ScrollView, {
					LayoutOrder = 2,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(1, 0, 0, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = Visibility.Always
					},
					Size = UDim2.new(1, 0, 1, -UseStateResult6.Y)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
					}),
					ProfilesList = ReactModule.createElement(ReactModule.Fragment, nil, (v43(UseStateResult, function(UserID)
						-- upvalues: EventServiceModule (upval), UseContextResult (copy), GetFFlagEnableContinueRecoveryFunction (upval), UseStateResult2_4 (copy), p1 (copy), AccountRecoveryPageStateModule (upval), UseStateResult1 (copy), UseStateResult2_3 (copy), ConstantsModule (upval)
						EventServiceModule.sendUserSelectedEvent(UseContextResult.state.recoverySessionId)
						
						if GetFFlagEnableContinueRecoveryFunction() then
							local function v50()
								-- upvalues: UseStateResult2_4 (upval), p1 (upval), AccountRecoveryPageStateModule (upval), UserID (copy), UseStateResult1 (upval)
								UseStateResult2_4(false)
								p1.navigation.navigate(AccountRecoveryPageStateModule.ResetPasswordScreen, {
									userID = UserID,
									shouldAddContactMethod = UseStateResult1
								})
							end
							
							local function v51(p2)
								-- upvalues: UseStateResult2_3 (upval), ConstantsModule (upval), UseStateResult2_4 (upval)
								UseStateResult2_3(p2 or ConstantsModule.UnknownErrorKey)
								UseStateResult2_4(false)
							end
							
							local function v52()
								-- upvalues: UseStateResult2_4 (upval)
								UseStateResult2_4(false)
							end
							
							UseStateResult2_4(true)
							UseStateResult2_3("")
							UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, UserID, v50, v51, v52, nil, nil, nil)
							
							return
						else
							p1.navigation.navigate(AccountRecoveryPageStateModule.ResetPasswordScreen, {
								userID = UserID,
								shouldAddContactMethod = UseStateResult1
							})
						end
					end)))
				})
			})
		})
	})
end