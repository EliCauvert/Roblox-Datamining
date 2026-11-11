local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local LoadingBar = require(CorePackages.Workspace.Packages.AppBlox).LoadingBar
local RoactModule = require(CorePackages.Packages.Roact)
local LoadingFriendsPage = RoactModule.PureComponent:extend("LoadingFriendsPage")

function LoadingFriendsPage.render(p1)
	-- upvalues: RoactModule (copy), LoadingBar (copy)
	local ZIndex = p1.props.ZIndex
	local Count = 0
	
	local function _(): number
		-- upvalues: Count (ref)
		Count += 1
		
		return Count
	end
	
	Count += 1
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.props.LayoutOrder,
		ZIndex = ZIndex
	}, {
		listLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		loadingIndicator = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 70, 0, 16),
			LayoutOrder = Count,
			ZIndex = ZIndex
		}, {
			loadingBar = RoactModule.createElement(LoadingBar, { ZIndex = ZIndex })
		})
	})
end

return LoadingFriendsPage