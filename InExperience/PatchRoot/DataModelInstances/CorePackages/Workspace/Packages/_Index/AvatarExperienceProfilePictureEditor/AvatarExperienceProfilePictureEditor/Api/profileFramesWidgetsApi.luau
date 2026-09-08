local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local httpModule = require(parent.Http)
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local getWidgetListInfo = require(parent.AvatarExperienceCatalog).Api.getWidgetListInfo

local function buildHydrateUrl()
	-- upvalues: httpModule (ref)
	return `{httpModule.Url.APIS_URL}marketplace-widgets/v1/widgets/hydrate`
end

local function extractWidgetContent(p1)
	local t = {}
	
	if p1 == nil then
		return t
	end
	local widgets = p1.widgets
	
	if widgets == nil then
		return t
	end
	for i, v in pairs(widgets) do
		local content = v.content
		
		if content ~= nil then
			for i_1, v_1 in content do
				table.insert(t, { type = v_1.type, id = v_1.id })
			end
		end
	end
	return t
end

local function hydrateWidgetContent(p2, p3)
	-- upvalues: httpService (ref), httpModule (ref), enumsModule (ref)
	return if #p3 == 0 then nil else p2(`{httpModule.Url.APIS_URL}marketplace-widgets/v1/widgets/hydrate`, enumsModule.RequestMethods.POST, { postBody = httpService:JSONEncode({ Content = p3 }) }):andThen(function(p4)
		return p4.responseBody
	end)
end

local function processWidgetsResponseAndHydrate(p2, p3)
	-- upvalues: extractWidgetContent (ref), promiseModule (ref), hydrateWidgetContent (ref)
	local var1 = extractWidgetContent(p3)
	
	return if #var1 == 0 then promiseModule.resolve({
		hydrateResponseBody = nil,
		widgetListInfo = p3,
		widgetContent = var1
	}) else hydrateWidgetContent(p2, var1):andThen(function(p4)
		-- upvalues: p3 (ref), var1 (ref)
		return {
			widgetListInfo = p3,
			hydrateResponseBody = p4,
			widgetContent = var1
		}
	end)
end

local function _(p2)
	return function(p3, p4)
		-- upvalues: p2 (ref)
		return p2(p3, p4)
	end
end

return {
	PROFILE_FRAMES_WIDGET_CONTEXT = "catalog-tab:profile-frames",
	buildHydrateUrl = buildHydrateUrl,
	extractWidgetContent = extractWidgetContent,
	fetchProfileFramesWidgets = function(p2, p3)
		-- upvalues: httpService (ref), getWidgetListInfo (ref), processWidgetsResponseAndHydrate (ref)
		return getWidgetListInfo(function(p4, p5)
			-- upvalues: p2 (ref)
			return p2(p4, p5)
		end, if p3 and p3.requestId then p3.requestId else httpService:GenerateGUID(false), "catalog-tab:profile-frames", nil):andThen(function(p4)
			-- upvalues: processWidgetsResponseAndHydrate (copy), p2 (ref)
			return processWidgetsResponseAndHydrate(p2, p4)
		end)
	end
}