local Parent = script:FindFirstAncestor("AppBlox").Parent
local DetailsPageTemplateModule = require(script.Parent.DetailsPageTemplate)
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local ReactModule = require(Parent.React)
local config = {
	[DeviceType.Console] = require(script.Parent.DetailsPageTenfootTemplate),
	[DeviceType.Phone] = DetailsPageTemplateModule,
	[DeviceType.Desktop] = DetailsPageTemplateModule,
	[DeviceType.Unknown] = DetailsPageTemplateModule,
	[DeviceType.Tablet] = DetailsPageTemplateModule,
	[DeviceType.VR] = DetailsPageTemplateModule
}

return function(p1) --[[ Line: 32 | Named "DetailsPageTemplateSelector" ]]
	-- upvalues: config (copy), DetailsPageTemplateModule (copy), ReactModule (copy)
	return ReactModule.createElement(config[p1.deviceType] or DetailsPageTemplateModule, p1.detailsPageProps)
end