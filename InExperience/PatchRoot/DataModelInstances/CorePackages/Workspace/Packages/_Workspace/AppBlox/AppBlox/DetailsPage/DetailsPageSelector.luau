local parent = script:FindFirstAncestor("AppBlox").Parent
local detailsPageTemplateModule = require(script.Parent.DetailsPageTemplate)
local detailsPageTenfootTemplateModule = require(script.Parent.DetailsPageTenfootTemplate)
local deviceType = require(parent.RobloxAppEnums).DeviceType
local reactModule = require(parent.React)
local t = {
	[deviceType.Console] = detailsPageTenfootTemplateModule,
	[deviceType.Phone] = detailsPageTemplateModule,
	[deviceType.Desktop] = detailsPageTemplateModule,
	[deviceType.Unknown] = detailsPageTemplateModule,
	[deviceType.Tablet] = detailsPageTemplateModule,
	[deviceType.VR] = detailsPageTemplateModule
}

return function(p0)
	-- upvalues: t (ref), detailsPageTemplateModule (ref), reactModule (ref)
	return reactModule.createElement(t[p0.deviceType] or detailsPageTemplateModule, p0.detailsPageProps)
end