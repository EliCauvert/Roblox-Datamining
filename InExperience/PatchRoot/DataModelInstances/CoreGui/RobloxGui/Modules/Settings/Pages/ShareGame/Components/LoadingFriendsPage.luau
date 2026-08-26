local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local loadingBar = require(corePackagesService.Workspace.Packages.AppBlox).LoadingBar
local roactModule = require(corePackagesService.Packages.Roact)
local loadingFriendsPage = roactModule.PureComponent:extend("LoadingFriendsPage")

function loadingFriendsPage.render(p1)
	-- upvalues: roactModule (ref), loadingBar (ref)
	local layoutOrder = p1.props.LayoutOrder
	local zIndex = p1.props.ZIndex
	local var1 = 0
	
	local function _()
		-- upvalues: var1 (write)
		var1 += 1
		
		return var1
	end
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = layoutOrder,
		ZIndex = zIndex
	}, {
		listLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		loadingIndicator = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 70, 0, 16),
			LayoutOrder = var1 + 1,
			ZIndex = zIndex
		}, {
			loadingBar = roactModule.createElement(loadingBar, { ZIndex = zIndex })
		})
	})
end

return loadingFriendsPage