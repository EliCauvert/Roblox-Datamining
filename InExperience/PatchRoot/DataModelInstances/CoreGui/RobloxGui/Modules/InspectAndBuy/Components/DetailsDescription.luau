local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local parent = script.Parent.Parent
local colorsModule = require(parent.Colors)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local detailsDescription = roactModule.PureComponent:extend("DetailsDescription")

function detailsDescription.setText(value)
	-- upvalues: utilityFunctionsModule (ref)
	local assetInfo = value.props.assetInfo or {}
	local bundleInfo = value.props.bundleInfo or {}
	
	if assetInfo.parentBundleId ~= nil then
		local bundleId = utilityFunctionsModule.getBundleId(assetInfo)
		
		if bundleInfo[bundleId] then
			value.description = bundleInfo[bundleId].description or ""
			
			return
		end
	elseif assetInfo then
		value.description = assetInfo.description or ""
	end
end

function detailsDescription.init(p0)
	-- upvalues: roactModule (ref)
	p0.description = ""
	p0.descriptionRef = roactModule.createRef()
end

function detailsDescription.render(p1)
	-- upvalues: roactModule (ref), appFonts (ref), colorsModule (ref)
	p1:setText()
	
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, -20, 0, p1:calculateSize()),
		Text = p1.description or "",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 16,
		TextWrapped = true,
		Font = appFonts.default:getDefault(),
		TextColor3 = colorsModule.White,
		[roactModule.Ref] = p1.descriptionRef
	})
end

function detailsDescription.calculateSize(p2)
	-- upvalues: textService (ref), appFonts (ref)
	if p2.descriptionRef.current and p2.props.assetInfo then
		return textService:GetTextSize(p2.description, 16, appFonts.default:getDefault(), Vector2.new(p2.descriptionRef.current.AbsoluteSize.X, 5000)).Y
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p3, _)
	return {
		view = p3.view,
		assetInfo = p3.assets[p3.detailsInformation.assetId],
		detailsInformation = p3.detailsInformation,
		bundleInfo = p3.bundles
	}
end)(detailsDescription)