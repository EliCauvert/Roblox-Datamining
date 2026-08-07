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
	bodyActivated = function() --[[ line: 25 ]]
		print("Card body was activated!")
	end
}

function assetCard.render(p0) --[[ line: 30 ]]
	-- upvalues: roactModule (ref), UIBloxModule (ref), fitFrameVerticalModule (ref), headerModule (ref), bodyModule (ref)
	local children = p0.props[roactModule.Children]
	
	return UIBloxModule.Style.withStyle(function(_) --[[ line: 33 ]]
		-- upvalues: roactModule (copy), fitFrameVerticalModule (copy), headerModule (copy), p0 (ref), bodyModule (copy), children (ref)
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
					cardTitle = p0.props.cardTitle or nil,
					isLoading = p0.props.isLoading
				}),
				body = roactModule.createElement(bodyModule, {
					LayoutOrder = 2,
					cardIcon = p0.props.cardIcon,
					cardBodyText = p0.props.cardBodyText or nil,
					isLoading = p0.props.isLoading,
					contentLoadedCallback = p0.props.contentLoadedCallback,
					bodyActivated = p0.props.bodyActivated
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