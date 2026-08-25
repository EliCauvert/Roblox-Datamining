local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local checkbox = foundationModule.Checkbox
local image = foundationModule.Image
local scaleType = Enum.ScaleType
local text = foundationModule.Text
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local componentSubtextModule = require(genericAbuseReporting.Bedui.Components.ComponentSubtext)
local getPlaceMediaAssetIdsModule = require(genericAbuseReporting.Bedui.Utils.getPlaceMediaAssetIds)
local useFormDataModule = require(genericAbuseReporting.Bedui.Provider.useFormData)
local uDim2 = UDim2.fromOffset(180, 101)
local t = { [abuseVectorModule.Place] = "THUMBNAIL_IDS" }

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useFormDataModule (ref), useRoactService (ref), roactNetworking (ref), abuseVectorModule (ref), getPlaceMediaAssetIdsModule (ref), t (ref), view (ref), checkbox (ref), image (ref), scaleType (ref), uDim2 (ref), text (ref), componentSubtextModule (ref)
	local var9, var10 = reactModule.useState({})
	local var11, var12 = reactModule.useState({})
	local custom = useFormDataModule().custom
	local updateForm = useFormDataModule().updateForm
	local updateAdditionalReportTags = useFormDataModule().updateAdditionalReportTags
	local var13 = useRoactService(roactNetworking)
	local var14 = reactModule.useRef(`selector-{DateTime.now()}`)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), abuseVectorModule (copy), getPlaceMediaAssetIdsModule (copy), var13 (ref), custom (ref), var10 (ref)
		if p0.abuseVector == abuseVectorModule.Place then
			getPlaceMediaAssetIdsModule(var13, tostring(custom and custom.universeId)):andThen(function(p1)
				-- upvalues: var10 (copy)
				var10(p1)
			end)
		end
	end, {
		p0.abuseVector,
		getPlaceMediaAssetIdsModule,
		var13,
		custom and custom.universeId
	})
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), p0 (ref), abuseVectorModule (copy), updateAdditionalReportTags (ref), var14 (ref), t (copy)
		var12(function(p3)
			-- upvalues: p2 (ref), p0 (copy), abuseVectorModule (copy), updateAdditionalReportTags (copy), var14 (copy), t (copy)
			local cloned = table.clone(p3)
			local index = table.find(cloned, p2)
			
			if index then
				table.remove(cloned, index)
			else
				table.insert(cloned, p2)
			end
			if p0.abuseVector == abuseVectorModule.Place then
				local joined = table.concat(cloned, ",")
				
				if updateAdditionalReportTags then
					updateAdditionalReportTags(var14.current, { tagKey = t[p0.abuseVector], tagValue = joined })
				end
			end
			return cloned
		end)
	end, { p0.component, p0.abuseVector, updateForm })
	
	return if #var9 == 0 then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = p0.layoutOrder
	}, {
		Prompt = reactModule.createElement(text, {
			tag = "auto-xy",
			LayoutOrder = 0,
			Text = p0.component.selector.prompt
		}),
		CheckboxGroup = reactModule.createElement(view, { tag = "size-full-0 auto-y col", LayoutOrder = 1 }, reactModule.useMemo(function()
			-- upvalues: var9 (ref), reactModule (copy), view (copy), checkbox (copy), var11 (ref), var15 (ref), image (copy), scaleType (copy), uDim2 (copy)
			local t = {}
			
			for i, v in ipairs(var9) do
				table.insert(t, reactModule.createElement(view, {
					tag = "size-0-0 auto-xy row gap-small self-center border-radius-medium padding-small",
					LayoutOrder = i
				}, {
					Checkbox = reactModule.createElement(checkbox, {
						label = "",
						isChecked = table.find(var11, v) ~= nil,
						onActivated = function()
							-- upvalues: var15 (copy), v (ref)
							var15(v)
						end
					}),
					Image = reactModule.createElement(image, {
						Image = `rbxthumb://type=Asset&id={v}&w=768&h=432`,
						ScaleType = scaleType.Fit,
						Size = uDim2,
						onActivated = function()
							-- upvalues: var15 (copy), v (ref)
							var15(v)
						end
					})
				}))
			end
			return t
		end, { var9, var11 })),
		ComponentSubtext = reactModule.createElement(componentSubtextModule, {
			layoutOrder = 2,
			isErrorState = p0.isErrorState,
			isOptional = p0.component.isOptional,
			requirementMessage = p0.component.requirementMessage
		})
	})
end)