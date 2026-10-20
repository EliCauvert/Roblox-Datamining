local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local Logger = require(Parent.Loggers).Logger
local GetUserByIdFunction = require(Parent.AuthCommon).Thunks.GetUserById
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local UserHeaderModule = require(AccountRecovery.Components.UserHeader)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseClearFocusOnUnmountFunction (copy), GetUserByIdFunction (copy), Logger (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), ScrollView (copy), Visibility (copy), UserHeaderModule (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UserIDParam = p1.navigation.getParam("userID")
	local IsConsoleParam = p1.navigation.getParam("isConsole") or false
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	UseClearFocusOnUnmountFunction()
	ReactModule.useEffect(function()
		-- upvalues: UserIDParam (copy), GetUserByIdFunction (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), Logger (upval)
		if UserIDParam and UserIDParam ~= 0 then
			GetUserByIdFunction(UseRoactServiceResult, `{UserIDParam}`):andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
				UseStateResult2_1(Result.name)
				UseStateResult2(Result.displayName)
			end):catch(function(Err)
				-- upvalues: Logger (upval)
				Logger:warning("Error getting user info: {}", Err)
			end)
		end
	end, {})
	
	local function v29(Frame: Frame)
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy)
		if UseStateResult3 ~= Frame.AbsoluteSize then
			UseStateResult2_2(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		useAnotherDeviceHeadingText = "Authentication.AccountRecovery.Heading.UseAnotherDevice",
		cannotRecoverAccountHeadingText = "Authentication.AccountRecovery.Heading.CannotRecoverAccount",
		bodyText = "Authentication.AccountRecovery.Description.CannotRecoverAccount",
		platformNotSupportedText = "Authentication.AccountRecovery.Description.PlatformNotSupported",
		okButtonText = "Authentication.AccountRecovery.Action.Ok"
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
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_500)
			}),
			PreScrollContent = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				[ReactModule.Change.AbsoluteSize] = v29
			}, {
				Header = ReactModule.createElement(RecoveryHeaderModule, {
					LayoutOrder = 1,
					currentComponent = "cannotRecoverAccount",
					recoveryHeadingText = IsConsoleParam and UseLocalizationResult.useAnotherDeviceHeadingText or UseLocalizationResult.cannotRecoverAccountHeadingText,
					recoverySessionId = UseContextResult.state.recoverySessionId
				})
			}),
			ContentScrollView = ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = Visibility.Auto
				},
				Size = UDim2.new(1, 0, 1, -UseStateResult3.Y)
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
				UserHeader = UserIDParam and (UserIDParam ~= 0 and ReactModule.createElement(UserHeaderModule, {
					LayoutOrder = 1,
					userId = `{UserIDParam}`,
					displayName = UseStateResult,
					username = UseStateResult1
				})),
				Body = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					TextWrapped = true,
					Text = IsConsoleParam and UseLocalizationResult.platformNotSupportedText or UseLocalizationResult.bodyText,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					textStyle = UseTokensResult.Color.Content.Default,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					padding = {
						top = UDim.new(0, UseTokensResult.Size.Size_300),
						bottom = UDim.new(0, UseTokensResult.Size.Size_300)
					}
				}),
				OkButton = ReactModule.createElement(Button, {
					LayoutOrder = 3,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					text = UseLocalizationResult.okButtonText,
					width = UDim.new(1, 0),
					onActivated = function()
						-- upvalues: UseContextResult (copy)
						UseContextResult.parentNavigation.goBack()
					end
				})
			})
		})
	})
end