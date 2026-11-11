local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local Parent = script.Parent.Parent
local ColorsModule = require(Parent.Colors)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local DetailsDescription = RoactModule.PureComponent:extend("DetailsDescription")

function DetailsDescription.setText(p1)
	-- upvalues: UtilityFunctionsModule (copy)
	local AssetInfo = p1.props.assetInfo or {}
	local BundleInfo = p1.props.bundleInfo or {}
	
	if AssetInfo.parentBundleId ~= nil then
		local BundleId = UtilityFunctionsModule.getBundleId(AssetInfo)
		
		if BundleInfo[BundleId] then
			p1.description = BundleInfo[BundleId].description or ""
			
			return
		end
	elseif AssetInfo then
		p1.description = AssetInfo.description or ""
	end
end

function DetailsDescription.init(p1)
	-- upvalues: RoactModule (copy)
	p1.description = ""
	p1.descriptionRef = RoactModule.createRef()
end

function DetailsDescription.render(p1)
	-- upvalues: RoactModule (copy), AppFonts (copy), ColorsModule (copy)
	p1:setText()
	
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, -20, 0, (p1:calculateSize())),
		Text = p1.description or "",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 16,
		TextWrapped = true,
		Font = AppFonts.default:getDefault(),
		TextColor3 = ColorsModule.White,
		[RoactModule.Ref] = p1.descriptionRef
	})
end

function DetailsDescription.calculateSize(p1)
	-- upvalues: TextService (copy), AppFonts (copy)
	if not p1.descriptionRef.current or not p1.props.assetInfo then return end
	return TextService:GetTextSize(p1.description, 16, AppFonts.default:getDefault(), Vector2.new(p1.descriptionRef.current.AbsoluteSize.X, 5000)).Y
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		detailsInformation = p1.detailsInformation,
		bundleInfo = p1.bundles
	}
end)(DetailsDescription)