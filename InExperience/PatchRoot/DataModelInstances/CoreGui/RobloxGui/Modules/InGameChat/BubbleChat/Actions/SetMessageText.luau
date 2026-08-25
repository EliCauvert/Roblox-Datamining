local corePackagesService = game:GetService("CorePackages")
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local var4 = tModule.tuple(tModule.string, tModule.string)

return makeActionCreator(script.Name, function(p0, p1)
	-- upvalues: maybeAssertModule (ref), var4 (ref), expChatModule (ref)
	maybeAssertModule(var4(p0, p1))
	expChatModule.Events.LegacyBubbleTextUpdated(p0, p1)
	
	return { messageId = p0, newText = p1 }
end)