local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local loadingBar = require(corePackagesService.Workspace.Packages.AppBlox).LoadingBar
local roactModule = require(corePackagesService.Packages.Roact)
local loadingFriendsPage = roactModule.PureComponent:extend("LoadingFriendsPage")

function loadingFriendsPage.render(p0) --[[ line: 14 ]]
	-- upvalues: roactModule (ref), loadingBar (ref)
	local layoutOrder = p0.props.LayoutOrder
	local zIndex = p0.props.ZIndex
	local var3 = 0
	
	local function _() --[[ line: 20 | named "incrementLayoutOrder" ]]
		-- upvalues: var3 (write)
		var3 += 1
		
		return var3
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
			LayoutOrder = var3 + 1,
			ZIndex = zIndex
		}, {
			loadingBar = roactModule.createElement(loadingBar, { ZIndex = zIndex })
		})
	})
end

return loadingFriendsPage