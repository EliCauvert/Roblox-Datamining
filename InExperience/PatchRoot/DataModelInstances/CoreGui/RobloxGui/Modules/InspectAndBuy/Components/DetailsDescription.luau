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

function detailsDescription.init(p1)
	-- upvalues: roactModule (ref)
	p1.description = ""
	p1.descriptionRef = roactModule.createRef()
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

function detailsDescription.calculateSize(p1)
	-- upvalues: textService (ref), appFonts (ref)
	if p1.descriptionRef.current and p1.props.assetInfo then
		return textService:GetTextSize(p1.description, 16, appFonts.default:getDefault(), Vector2.new(p1.descriptionRef.current.AbsoluteSize.X, 5000)).Y
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		detailsInformation = p1.detailsInformation,
		bundleInfo = p1.bundles
	}
end)(detailsDescription)