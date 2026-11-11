local DependenciesModule = require(script.Parent.Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Cell = UIBlox.App.Table.Cell
local LoadableImage = UIBlox.App.Loading.LoadableImage
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBlox.Core.Style.useStyle
local GetStandardSizeAvatarHeadShotRbxthumbFunction = DependenciesModule.UserLib.Utils.getStandardSizeAvatarHeadShotRbxthumb
local UseStateFunction = React.useState
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens
local SelectionRowModule = require(script.Parent.SelectionRow)
local ShouldUseSelectionRowInAccountSelectionRelease1 = game:DefineFastFlag("ShouldUseSelectionRowInAccountSelectionRelease1", false)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseStateFunction (copy), ShouldUseSelectionRowInAccountSelectionRelease1 (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), React (copy), LoadableImage (copy), SelectionRowModule (copy), StyledTextLabel (copy), ImageSetLabel (copy), Images (copy), Cell (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	
	local function handleAccountSelection()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		if not p1.isDisabled and not p1.user.isUnselectable then
			UseStateResult2(true)
			p1.onAccountSelection(p1.user.id)
		end
	end
	
	if ShouldUseSelectionRowInAccountSelectionRelease1 then
		return React.createElement(SelectionRowModule, {
			titleContent = p1.user.displayName,
			subtitleContent = "@" .. (p1.user.name or ""),
			renderImage = function()
				-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), p1 (copy), React (upval), LoadableImage (upval)
				return React.createElement(LoadableImage, {
					useShimmerAnimationWhileLoading = true,
					shouldHandleReloads = true,
					Size = UDim2.new(0, 48, 0, 48),
					Image = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1.user.id))),
					cornerRadius = UDim.new(0.5, 0)
				})
			end,
			iconKey = p1.user.iconKey,
			onAccountSelection = handleAccountSelection,
			userInteractionEnabled = not p1.user.isUnselectable
		})
	else
		local function renderAvatarImage()
			-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), p1 (copy), React (upval), LoadableImage (upval)
			return React.createElement(LoadableImage, {
				useShimmerAnimationWhileLoading = true,
				shouldHandleReloads = true,
				Size = UDim2.new(0, 48, 0, 48),
				Image = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1.user.id))),
				cornerRadius = UDim.new(0.5, 0)
			})
		end
		
		local function renderNames()
			-- upvalues: React (upval), StyledTextLabel (upval), p1 (copy), UseStyleResult (copy)
			return React.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				VerticalLayout = React.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				DisplayName = React.createElement(StyledTextLabel, {
					layoutOrder = 0,
					text = p1.user.displayName,
					fontStyle = UseStyleResult.Font.Header2,
					colorStyle = UseStyleResult.Theme.TextEmphasis
				}),
				UserName = React.createElement(StyledTextLabel, {
					layoutOrder = 1,
					text = "@" .. p1.user.name,
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextDefault
				})
			})
		end
		
		local Element = React.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(28, 28),
			Image = Images["icons/status/success_large"],
			ImageColor3 = UseStyleResult.Theme.Success.Color
		})
		
		return React.createElement(Cell, {
			onActivated = handleAccountSelection,
			isSelected = UseStateResult,
			head = (function()
				-- upvalues: React (upval), UseDesignTokensResult (copy), renderAvatarImage (copy), renderNames (copy)
				return React.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					Layout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, UseDesignTokensResult.Size.Size_200)
					}),
					AvatarThumbnail = renderAvatarImage(),
					Names = renderNames()
				})
			end)(),
			tail = UseStateResult and Element or React.createElement("Frame"),
			background = (function()
				-- upvalues: React (upval), UseStyleResult (copy)
				return React.createElement("Frame", {
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
					BackgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.BackgroundTransparency,
					BorderColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color
				})
			end)(),
			size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1600)
		})
	end
end