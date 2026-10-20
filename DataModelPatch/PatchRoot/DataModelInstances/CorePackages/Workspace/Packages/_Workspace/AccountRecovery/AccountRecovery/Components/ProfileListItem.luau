local Parent = script:FindFirstAncestor("AccountRecovery").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local Logger = require(Parent.Loggers).Logger
local GetUserByIdFunction = require(Parent.AuthCommon).Thunks.GetUserById
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), GetUserByIdFunction (copy), Logger (copy), View (copy), LoadableImage (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: GetUserByIdFunction (upval), UseRoactServiceResult (copy), p1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), Logger (upval)
		GetUserByIdFunction(UseRoactServiceResult, `{p1.userId}`):andThen(function(Result)
			-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
			UseStateResult2_1(Result.name)
			UseStateResult2(Result.displayName)
		end):catch(function(Err)
			-- upvalues: Logger (upval)
			Logger:warning("Error getting user info: {}", Err)
		end)
	end, {})
	
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		LayoutOrder = p1.index,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		onActivated = function()
			-- upvalues: p1 (copy)
			p1.onProfileActivated(p1.userId)
		end
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_300)
		}),
		HorizontalLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Size.Size_400)
		}),
		AvatarImage = ReactModule.createElement(LoadableImage, {
			LayoutOrder = 1,
			useShimmerAnimationWhileLoading = true,
			shouldHandleReloads = true,
			Size = UDim2.new(0, 48, 0, 48),
			Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(`{p1.userId}`),
			cornerRadius = UDim.new(0.5, 0)
		}),
		UsernameAndDisplayName = ReactModule.createElement(View, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			DisplayName = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = UseStateResult,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				fontStyle = UseTokensResult.Typography.TitleMedium,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			Username = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = "@" .. UseStateResult1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				fontStyle = UseTokensResult.Typography.BodyMedium,
				textStyle = UseTokensResult.Color.Content.Default,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	})
end