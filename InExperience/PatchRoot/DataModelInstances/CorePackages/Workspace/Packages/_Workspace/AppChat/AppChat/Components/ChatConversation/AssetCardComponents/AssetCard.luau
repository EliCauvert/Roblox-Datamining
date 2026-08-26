local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local headerModule = require(script.Parent.Header)
local bodyModule = require(script.Parent.Body)
local fitFrameVerticalModule = require(script.Parent.FitFrameVertical)
local assetCard = roactModule.PureComponent:extend("AssetCard")
assetCard.defaultProps = {
	cardTitle = nil,
	cardIcon = nil,
	cardBodyText = nil,
	contentLoadedCallback = nil,
	bodyActivated = function()
		print("Card body was activated!")
	end
}

function assetCard.render(p1)
	-- upvalues: roactModule (ref), UIBloxModule (ref), fitFrameVerticalModule (ref), headerModule (ref), bodyModule (ref)
	local children = p1.props[roactModule.Children]
	
	return UIBloxModule.Style.withStyle(function(_)
		-- upvalues: roactModule (copy), fitFrameVerticalModule (copy), headerModule (copy), p1 (ref), bodyModule (copy), children (ref)
		return roactModule.createElement(fitFrameVerticalModule, {
			BackgroundTransparency = 1,
			Visible = true,
			LayoutOrder = 2,
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, 5)
		}, {
			topSpacing = roactModule.createElement(fitFrameVerticalModule, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 12)
			}, {
				header = roactModule.createElement(headerModule, {
					LayoutOrder = 1,
					cardTitle = p1.props.cardTitle or nil,
					isLoading = p1.props.isLoading
				}),
				body = roactModule.createElement(bodyModule, {
					LayoutOrder = 2,
					cardIcon = p1.props.cardIcon,
					cardBodyText = p1.props.cardBodyText or nil,
					isLoading = p1.props.isLoading,
					contentLoadedCallback = p1.props.contentLoadedCallback,
					bodyActivated = p1.props.bodyActivated
				})
			}),
			bottomSpacing = roactModule.createElement(fitFrameVerticalModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				width = UDim.new(1, 0)
			}, children)
		})
	end)
end

return assetCard