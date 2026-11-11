local config = {
	ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.Dating",
	ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.Dating",
	ruleDescription = "Feature.NotApproved.Description.RuleExplanation.Dating",
	importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
	importanceDescription = "Feature.NotApproved.Description.RuleImportance.Dating",
	policyKey = "dating"
}
local config1 = {
	ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.BullyingHarassmentDiscrimination",
	ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.BullyingHarassmentDiscrimination",
	ruleDescription = "Feature.NotApproved.Description.RuleExplanation.BullyingHarassmentDiscrimination",
	importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
	importanceDescription = "Feature.NotApproved.Description.RuleImportance.BullyingHarassmentDiscrimination",
	policyKey = "bullying-harassment-discrimination"
}
local config2 = {
	ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.MisusingRobloxSystems",
	ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.MisusingRobloxSystems",
	ruleDescription = "Feature.NotApproved.Description.RuleExplanation.MisusingRobloxSystems",
	ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.MisusingRobloxSystems",
	importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
	importanceDescription = "Feature.NotApproved.Description.RuleImportance.MisusingRobloxSystems",
	policyKey = "misusing-roblox-systems"
}
local config3 = {
	ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.PII",
	ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.PII",
	ruleDescription = "Feature.NotApproved.Description.RuleExplanation.PII",
	ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.PII",
	importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
	importanceDescription = "Feature.NotApproved.Description.RuleImportance.PII",
	policyKey = "pii"
}
local config4 = {
	ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.SSHAndIllegalRegulatedActivities",
	ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities",
	ruleDescription = "Feature.NotApproved.Description.RuleExplanation.SSHAndIllegalRegulatedActivities",
	ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.SSHAndIllegalRegAct",
	importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
	importanceDescription = "Feature.NotApproved.Description.RuleImportance.SSHAndIllegalRegulatedActivities",
	policyKey = "ssh-and-illegal-regulated-activities"
}

return {
	["Label.AbuseType.CheatandExploits"] = config2,
	["Label.AbuseType.ContestsandSweepstakes"] = config4,
	["Label.AbuseType.Dating"] = config,
	["Label.AbuseType.DirectingUsersOffPlatform"] = {
		ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.DirectingUsersOffPlatform",
		ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.DirectingUsersOffPlatform",
		ruleDescription = "Feature.NotApproved.Description.RuleExplanation.DirectingUsersOffPlatform",
		importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
		importanceDescription = "Feature.NotApproved.Description.RuleImportance.DirectingUsersOffPlatform",
		policyKey = "directing-users-off-platform"
	},
	["Label.AbuseType.DiscriminatoryContent"] = config1,
	["Label.AbuseType.DisruptiveAudio"] = config2,
	["Label.AbuseType.EncouragingDangerousBehavior"] = config4,
	["Label.AbuseType.ExtortionandBlackmail"] = config1,
	["Label.AbuseType.Harassment"] = config1,
	["Label.AbuseType.IllegalandRegulatedContent"] = config4,
	["Label.AbuseType.Impersonation"] = config1,
	["Label.AbuseType.IrlDangerousActivities"] = config4,
	["Label.AbuseType.MisusingRobloxSystems"] = config2,
	["Label.AbuseType.OffPlatformSpeechandBehavior"] = config1,
	["Label.AbuseType.PrivacyAskingforPII"] = config3,
	["Label.AbuseType.PrivacyGivingPII"] = config3,
	["Label.AbuseType.RealLifeThreats"] = config1,
	["Label.AbuseType.Scamming"] = config2,
	["Label.AbuseType.SexualContent"] = config,
	["Label.AbuseType.Spam"] = {
		ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.Spam",
		ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.Spam",
		ruleDescription = "Feature.NotApproved.Description.RuleExplanation.Spam",
		importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
		importanceDescription = "Feature.NotApproved.Description.RuleImportance.Spam",
		policyKey = "spam"
	},
	["Label.AbuseType.SuicideSelfHarm"] = config4,
	["Label.AbuseType.Swearing"] = {
		ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.Swearing",
		ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.Swearing",
		ruleDescription = "Feature.NotApproved.Description.RuleExplanation.Swearing",
		importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
		importanceDescription = "Feature.NotApproved.Description.RuleImportance.Swearing",
		policyKey = "swearing"
	},
	["Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates"] = config1,
	["Label.AbuseType.ViolentContentAndGore"] = {
		ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.ViolentContentAndGore",
		ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.ViolentContentAndGore",
		ruleDescription = "Feature.NotApproved.Description.RuleExplanation.ViolentContentAndGore",
		importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
		importanceDescription = "Feature.NotApproved.Description.RuleImportance.ViolentContentAndGore",
		policyKey = "violent-content-and-gore"
	},
	["Label.AbuseType.VirtualCasino"] = config4,
	["Label.Sublabel.RealLifeEvents"] = {
		ruleTitle = "Feature.NotApproved.Heading.RuleExplanation.RealLifeEvents",
		ruleSubtitle = "Feature.NotApproved.SubHeading.RuleExplanation.RealLifeEvents",
		ruleDescription = "Feature.NotApproved.Description.RuleExplanation.RealLifeEvents",
		ruleDescriptionBullets = "Feature.NotApproved.Description.RuleExplanation.Bullets.RealLifeEvents",
		importanceTitle = "Feature.NotApproved.Heading.RuleImportance",
		importanceDescription = "Feature.NotApproved.Description.RuleImportance.RealLifeEvents",
		policyKey = "real-life-events"
	},
	["Label.Sublabel.RomanceOrSex"] = config
}