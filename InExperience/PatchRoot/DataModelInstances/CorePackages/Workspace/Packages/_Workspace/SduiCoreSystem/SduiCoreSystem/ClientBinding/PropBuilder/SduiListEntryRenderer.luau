local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Signals)
local BuildInputsForNestedComponentModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local _ = require(SduiCoreSystem.SduiComponentType)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local BuildConfigForComponentFunction = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local SduiDeferredItemStubModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiDeferredItemStub)
local t = {}

local function unwrapEntryData(Tbl)
	if typeof(Tbl) ~= "table" then
		return { value = Tbl }
	end
	local InputData = Tbl.input_data
	
	if not InputData or not InputData.kind or not InputData.kind.value then
		return table.clone(Tbl)
	end
	local t = {}
	
	if typeof(InputData.kind.value) == "table" then
		for i, value in InputData.kind.value do
			t[i] = value
		end
	end
	return t
end

local function fillInputs(p1, Inputs, p2, p3, p4, p5, p6)
	-- upvalues: BuildInputsForNestedComponentModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy)
	if Inputs == nil then return end
	local Success, Result = pcall(function()
		-- upvalues: BuildInputsForNestedComponentModule (upval), p2 (copy), Inputs (copy), p3 (copy), p4 (copy), p1 (copy), p5 (copy)
		BuildInputsForNestedComponentModule(p2, Inputs, p3, p4, p1, p5)
	end)
	
	if not Success then
		SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = `Failed to build inputs for ComponentList item: {SduiParseHelpersModule.stringifyValue(Result)}`,
			name = p6.name,
			componentType = p6.componentType,
			parserName = p6.parserName
		}, p6.appPage)
	end
end

return {
	captureErrorContext = function(p7)
		return {
			name = p7.debugName,
			componentType = p7.currentComponentType,
			parserName = p7.currentParserName,
			appPage = p7.appPage
		}
	end,
	createInputSlicer = function(Callback1, p7, p8, p9, Callback)
		-- upvalues: fillInputs (copy), CryoModule (copy), t (copy), unwrapEntryData (copy)
		local function rawSlice(p10, p11)
			-- upvalues: Callback1 (copy), fillInputs (upval), p7 (copy), p8 (copy), p9 (copy), CryoModule (upval), t (upval), unwrapEntryData (upval)
			if p10.sourceMode == "literal" then
				return if p11 then Callback1 else function(p12)
					-- upvalues: fillInputs (upval), p10 (copy), Callback1 (upval), p7 (upval), p8 (upval), p9 (upval)
					local t = {}
					fillInputs(t, p10.inputs, Callback1, p7, p12, p8, p9)
					
					return t
				end
			else
				local Item = p10.item
				
				return if p11 then function(p12)
					-- upvalues: CryoModule (upval), Callback1 (upval), Item (copy), t (upval)
					return CryoModule.Dictionary.join(Callback1(p12), if typeof(Item) == "table" then Item else t)
				end else function(p12)
					-- upvalues: unwrapEntryData (upval), Item (copy), fillInputs (upval), p10 (copy), Callback1 (upval), p7 (upval), p8 (upval), p9 (upval)
					local UnwrapEntryDataResult = unwrapEntryData(Item)
					fillInputs(UnwrapEntryDataResult, p10.inputs, Callback1, p7, p12, p8, p9)
					
					return UnwrapEntryDataResult
				end
			end
		end
		
		return if Callback == nil then rawSlice else function(p10, p11)
			-- upvalues: rawSlice (copy), Callback (copy), CryoModule (upval)
			local RawSliceResult = rawSlice(p10, p11)
			
			return function(p12)
				-- upvalues: Callback (upval), p10 (copy), RawSliceResult (copy), CryoModule (upval)
				local CallbackResult = Callback(p10)
				
				return if CallbackResult == nil then RawSliceResult(p12) else CryoModule.Dictionary.join(RawSliceResult(p12), CallbackResult)
			end
		end
	end,
	buildEntryConfigs = function(List, Callback, p7, p8, p9, p10, p11, p12, p13, Callback1)
		-- upvalues: SduiPropUtilsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiDeferredItemStubModule (copy), BuildConfigForComponentFunction (copy)
		local List1 = {}
		local List2 = {}
		local HasCallback = Callback1 ~= nil
		for i, value in List do
			if p7 and p7[i] then
				local v1 = p7[i]
				
				if SduiPropUtilsModule.isComponentVisible(v1, p12) then
					if HasCallback then
						local CallbackResult = Callback1(value, p12)
						
						if CallbackResult ~= nil then
							for i1, value1 in CallbackResult do
								v1[i1] = value1
							end
						end
					end
					table.insert(List1, v1)
					table.insert(List2, i)
					continue
				end
			elseif value.template == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `No template found for ComponentList item (identifier: {value.identifier or tostring(i)})`,
					name = p9.name,
					componentType = p9.componentType,
					parserName = p9.parserName
				}, p9.appPage)
			else
				local CallbackResult = Callback(value, value.isInline)
				local v2 = if value.isInline then p11 else nil
				
				if p13 and (not value.template or (not value.template.kind or (not value.template.kind.value or (not value.template.kind.value.shared or value.template.kind.value.shared.is_component_filtered == nil)))) then
					local Stub = SduiDeferredItemStubModule.makeStub(value.template, CallbackResult, p8, p10, v2, p9)
					
					if HasCallback then
						local CallbackResult1 = Callback1(value, p12)
						
						if CallbackResult1 ~= nil then
							for i2, value2 in CallbackResult1 do
								Stub[i2] = value2
							end
						end
					end
					table.insert(List1, Stub)
					table.insert(List2, i)
					continue
				else
					local ConfigForComponent = BuildConfigForComponentFunction(value.template, CallbackResult, p8, p10, nil, v2)
					
					if ConfigForComponent and SduiPropUtilsModule.isComponentVisible(ConfigForComponent, p12) then
						if HasCallback then
							local CallbackResult2 = Callback1(value, p12)
							
							if CallbackResult2 ~= nil then
								for i3, value3 in CallbackResult2 do
									ConfigForComponent[i3] = value3
								end
							end
						end
						table.insert(List1, ConfigForComponent)
						table.insert(List2, i)
					end
				end
			end
		end
		return List1, List2
	end
}