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

return function(p1)
	-- upvalues: t (ref), detailsPageTemplateModule (ref), reactModule (ref)
	return reactModule.createElement(t[p1.deviceType] or detailsPageTemplateModule, p1.detailsPageProps)
end