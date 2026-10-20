local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)
local CreationToolRegistryModule = require(MomentsCreation.Tools.creationToolRegistry)
local DefaultCreationToolsModule = require(MomentsCreation.Tools.defaultCreationTools)
local CreateCapturePreviewControllerModule = require(MomentsCreation.Preview.createCapturePreviewController)
local CreateEditSessionModule = require(MomentsCreation.Stores.createEditSession)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local MomentsCommonModule = require(Parent.MomentsCommon)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local GetFFlagMomentsAnalyticsProducerPrereqsFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local CreateComputedFunction = SignalsModule.createComputed
local CreateSignalFunction = SignalsModule.createSignal

return function(p1)
	-- upvalues: CreationToolRegistryModule (copy), DefaultCreationToolsModule (copy), CreateSignalFunction (copy), CreateComputedFunction (copy), CreateCapturePreviewControllerModule (copy), SessionManager (copy), FunnelEventNames (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy), CreationFlowStateModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), CreateEditSessionModule (copy), DialogTypeModule (copy), GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy)
	local Store = p1.store
	local Host = p1.host or {}
	local Registry = p1.registry or CreationToolRegistryModule(DefaultCreationToolsModule)
	local v1 = nil
	local Signal, Signal2 = CreateSignalFunction(nil)
	
	local function _(p2)
		-- upvalues: Signal2 (copy)
		Signal2(p2)
	end
	
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Computed = CreateComputedFunction(function(p2)
		-- upvalues: Store (copy), Registry (copy)
		local t = {}
		
		for i, value in Store.getEditsMap(p2) do
			if value ~= nil then
				local GetResult = Registry.get(i)
				
				if GetResult == nil or GetResult.toEdits == nil then
					t[i] = value
				else
					for i1, value1 in GetResult.toEdits(value) do
						t[i1] = value1
					end
				end
			end
		end
		return t
	end)
	local Computed1 = CreateComputedFunction(function(p3)
		-- upvalues: Store (copy), Computed (copy), Registry (copy)
		local SelectedCapture = Store.getSelectedCapture(p3)
		local CaptureType = if SelectedCapture == nil then nil else SelectedCapture.CaptureType
		local config = { captureType = CaptureType, getComposedEdits = Computed }
		local List = {}
		
		for _, value in Registry.getAll() do
			if (value.supportedCaptureTypes == nil or CaptureType ~= nil and table.find(value.supportedCaptureTypes, CaptureType) ~= nil) and (value.isAvailable == nil or value.isAvailable(config)) then
				table.insert(List, value)
			end
		end
		return List
	end)
	local Computed2 = CreateComputedFunction(function(p4)
		-- upvalues: Store (copy), Registry (copy)
		local Step = Store.getStep(p4)
		
		for _, value in Registry.getAll() do
			if value.step == Step then
				return value
			end
		end
		return nil
	end)
	local Computed3 = CreateComputedFunction(function(p5)
		-- upvalues: Computed2 (copy), Signal (copy), Computed (copy)
		local ComputedResult = Computed2(p5)
		
		if ComputedResult ~= nil and ComputedResult.kind == "trim" then
			local SignalResult = Signal(p5)
			local Draft = if SignalResult == nil then nil else SignalResult.getDraft(p5)
			
			if Draft ~= nil and Draft.startTime ~= nil and Draft.endTime ~= nil then
				return { startTime = Draft.startTime, endTime = Draft.endTime }
			end
		end
		local Trim = Computed(p5).trim
		
		return if Trim == nil or Trim.startTime == nil or Trim.endTime == nil then nil else { startTime = Trim.startTime, endTime = Trim.endTime }
	end)
	local Computed4 = CreateComputedFunction(function(p5)
		-- upvalues: Computed2 (copy), Signal (copy), Computed (copy)
		local ComputedResult = Computed2(p5)
		
		if ComputedResult ~= nil and ComputedResult.kind == "music" then
			local SignalResult = Signal(p5)
			local Draft = if SignalResult == nil then nil else SignalResult.getDraft(p5)
			
			if Draft ~= nil and Draft.assetId ~= nil then
				return Draft
			end
		end
		return Computed(p5).music
	end)
	
	local function dismissModal()
		-- upvalues: Signal2_1 (copy)
		Signal2_1(nil)
	end
	
	local function withCreationSession(ToolField)
		-- upvalues: SessionManager (upval), FunnelEventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval)
		return CryoModule.Dictionary.join(ToolField, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
	end
	
	local _ = function()
		-- upvalues: Signal2_1 (copy), Store (copy), p1 (copy), CreationFlowStateModule (upval), Host (copy)
		Signal2_1(nil)
		Store.clearEdits(if p1.excludeGallery then CreationFlowStateModule.Preview else CreationFlowStateModule.Gallery)
		
		if Host.exitCreationFlow ~= nil then
			Host.exitCreationFlow()
		end
	end
	
	v1 = {
		getStep = Store.getStep,
		navigate = function(Preview)
			-- upvalues: Store (copy)
			Store.navigate(Preview)
		end,
		returnToGallery = function()
			-- upvalues: Store (copy), CreationFlowStateModule (upval), Signal2 (copy)
			Store.clearEdits(CreationFlowStateModule.Gallery)
			Signal2(nil)
		end,
		getSelectedCapture = Store.getSelectedCapture,
		selectCapture = function(p5)
			-- upvalues: Store (copy), FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval)
			Store.onSelectedCaptureUpdated(p5)
			
			if p5 ~= nil then
				FireAnalyticsEventModule(EventNames.EditingFlowGalleryItemSelected, withCreationSession(MakeCreationEventFieldsModule.makeToolFieldFromKind("gallery")))
			end
		end,
		getDescription = Store.getDescription,
		setDescription = function(p5)
			-- upvalues: Store (copy)
			Store.updateDescription(p5)
		end,
		getAvailableTools = Computed1,
		getActiveTool = Computed2,
		getActiveSession = Signal,
		getComposedEdits = Computed,
		beginTool = function(p5)
			-- upvalues: Registry (copy), FireAnalyticsEventModule (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), v1 (ref), CreateEditSessionModule (upval), Store (copy), Signal2 (copy)
			local GetResult = Registry.get(p5)
			
			if GetResult == nil then return end
			if GetResult.cta.analyticsEvent ~= nil then
				FireAnalyticsEventModule(GetResult.cta.analyticsEvent, withCreationSession(MakeCreationEventFieldsModule.makeToolField(GetResult)))
			end
			if GetResult.presentation ~= "InstantAction" then
				local CreateSessionFunction = GetResult.createSession
				local EditSessionModule = if CreateSessionFunction == nil then CreateEditSessionModule() else CreateSessionFunction()
				
				if GetResult.step == nil or Store.navigate(GetResult.step) then
					EditSessionModule.begin(Store.getEditsMap(false)[p5])
					Signal2(EditSessionModule)
					
					return
				end
				return
			elseif GetResult.apply ~= nil then
				GetResult.apply(v1)
			end
		end,
		commitActiveTool = function()
			-- upvalues: Signal (copy), Computed2 (copy), Store (copy), CreationFlowStateModule (upval), v1 (ref), FireAnalyticsEventModule (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), Signal2 (copy)
			local SignalResult = Signal(false)
			local ComputedResult = Computed2(false)
			
			if SignalResult == nil or ComputedResult == nil then
				Store.navigate(CreationFlowStateModule.Preview)
				
				return
			end
			local CommitResult = SignalResult.commit()
			
			if ComputedResult.onCommit ~= nil and ComputedResult.onCommit(CommitResult, v1) == false then return end
			Store.setCommittedEdit(ComputedResult.kind, CommitResult)
			
			if ComputedResult.cta.commitAnalyticsEvent ~= nil then
				FireAnalyticsEventModule(ComputedResult.cta.commitAnalyticsEvent, withCreationSession(MakeCreationEventFieldsModule.makeToolField(ComputedResult)))
			end
			Signal2(nil)
			Store.navigate(CreationFlowStateModule.Preview)
		end,
		discardActiveTool = function()
			-- upvalues: Signal (copy), Computed2 (copy), FireAnalyticsEventModule (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), Signal2 (copy), Store (copy), CreationFlowStateModule (upval)
			local SignalResult = Signal(false)
			local ComputedResult = Computed2(false)
			
			if SignalResult ~= nil then
				SignalResult.discard()
			end
			if ComputedResult ~= nil and ComputedResult.cta.cancelAnalyticsEvent ~= nil then
				FireAnalyticsEventModule(ComputedResult.cta.cancelAnalyticsEvent, withCreationSession(MakeCreationEventFieldsModule.makeToolField(ComputedResult)))
			end
			Signal2(nil)
			Store.navigate(CreationFlowStateModule.Preview)
		end,
		updateCommittedEdit = function(p5, p6)
			-- upvalues: Store (copy)
			Store.setCommittedEdit(p5, p6)
		end,
		getActiveModal = Signal1,
		showModal = function(p5)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p5)
		end,
		dismissModal = dismissModal,
		publish = function()
			-- upvalues: Store (copy), Host (copy), Signal2_1 (copy), DialogTypeModule (upval), dismissModal (copy), GetFFlagMomentsAnalyticsProducerPrereqsFunction (upval), SessionManager (upval), FunnelEventNames (upval), Computed (copy), FireAnalyticsEventModule (upval), EventNames (upval), CryoModule (upval), MakeCreationEventFieldsModule (upval), p1 (copy), CreationFlowStateModule (upval)
			local Description = Store.getDescription(false)
			
			if Host.isTextFiltered ~= nil and Host.isTextFiltered(Description) then
				Signal2_1({
					modalType = DialogTypeModule.TextFiltered,
					modalProps = { onConfirm = dismissModal }
				})
				
				return
			end
			local SessionId = if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow) else nil
			
			if Host.createMoment ~= nil then
				Host.createMoment(Store.getSelectedCapture(false), Computed(false), Description, SessionId)
			end
			FireAnalyticsEventModule(EventNames.MomentsEditingFlowPublished, CryoModule.Dictionary.join(MakeCreationEventFieldsModule.makeStepField(EventNames.MomentsEditingFlowPublished), MakeCreationEventFieldsModule.makeCreationBaseFields(SessionId)))
			Signal2_1(nil)
			Store.clearEdits(if p1.excludeGallery then CreationFlowStateModule.Preview else CreationFlowStateModule.Gallery)
			
			if Host.exitCreationFlow ~= nil then
				Host.exitCreationFlow()
			end
		end,
		exit = function()
			-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), withCreationSession (copy), MakeCreationEventFieldsModule (upval), Signal2_1 (copy), Store (copy), p1 (copy), CreationFlowStateModule (upval), Host (copy)
			FireAnalyticsEventModule(EventNames.MomentsEditingFlowExited, withCreationSession(MakeCreationEventFieldsModule.makeStepField(EventNames.MomentsEditingFlowExited)))
			Signal2_1(nil)
			Store.clearEdits(if p1.excludeGallery then CreationFlowStateModule.Preview else CreationFlowStateModule.Gallery)
			
			if Host.exitCreationFlow ~= nil then
				Host.exitCreationFlow()
			end
		end,
		preview = p1.preview or CreateCapturePreviewControllerModule(Store, Computed3, Computed4)
	}
	
	return v1
end