local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local HeaderModule = require(script.Parent.Header)
local BodyModule = require(script.Parent.Body)
local FitFrameVerticalModule = require(script.Parent.FitFrameVertical)
local AssetCard = RoactModule.PureComponent:extend("AssetCard")
AssetCard.defaultProps = {
	cardTitle = nil,
	cardIcon = nil,
	cardBodyText = nil,
	contentLoadedCallback = nil,
	bodyActivated = function()
		print("Card body was activated!")
	end
}

function AssetCard.render(p1)
	-- upvalues: RoactModule (copy), UIBloxModule (copy), FitFrameVerticalModule (copy), HeaderModule (copy), BodyModule (copy)
	local Prop = p1.props[RoactModule.Children]
	
	return UIBloxModule.Style.withStyle(function(_)
		-- upvalues: RoactModule (upval), FitFrameVerticalModule (upval), HeaderModule (upval), p1 (copy), BodyModule (upval), Prop (copy)
		return RoactModule.createElement(FitFrameVerticalModule, {
			BackgroundTransparency = 1,
			Visible = true,
			LayoutOrder = 2,
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, 5)
		}, {
			topSpacing = RoactModule.createElement(FitFrameVerticalModule, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12)
			}, {
				header = RoactModule.createElement(HeaderModule, {
					LayoutOrder = 1,
					cardTitle = p1.props.cardTitle or nil,
					isLoading = p1.props.isLoading
				}),
				body = RoactModule.createElement(BodyModule, {
					LayoutOrder = 2,
					cardIcon = p1.props.cardIcon,
					cardBodyText = p1.props.cardBodyText or nil,
					isLoading = p1.props.isLoading,
					contentLoadedCallback = p1.props.contentLoadedCallback,
					bodyActivated = p1.props.bodyActivated
				})
			}),
			bottomSpacing = RoactModule.createElement(FitFrameVerticalModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				width = UDim.new(1, 0)
			}, Prop)
		})
	end)
end

return AssetCard