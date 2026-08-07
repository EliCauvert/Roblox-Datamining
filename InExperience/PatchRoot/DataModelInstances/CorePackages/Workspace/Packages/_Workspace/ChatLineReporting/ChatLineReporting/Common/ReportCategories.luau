local abuseCategoryModule = require(script:FindFirstAncestor("ChatLineReporting").Parent.GenericAbuseReporting.AbuseCategory)

return {
	{
		localizationKey = "Feature.ReportAbuse.Problem.Bullying",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying",
		value = abuseCategoryModule.ABUSE_CATEGORY_BULLYING
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Cheating",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Cheating",
		value = abuseCategoryModule.ABUSE_CATEGORY_CHEATING
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Dating",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Dating",
		value = abuseCategoryModule.ABUSE_CATEGORY_DATING
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Hate",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Hate",
		value = abuseCategoryModule.ABUSE_CATEGORY_HATE_SPEECH
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Links",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Links",
		value = abuseCategoryModule.ABUSE_CATEGORY_OFFSITE_LINKS
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Personal",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Personal",
		value = abuseCategoryModule.ABUSE_CATEGORY_PERSONAL_QUESTION
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Scamming",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Scamming",
		value = abuseCategoryModule.ABUSE_CATEGORY_SCAMMING
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Spamming",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Spamming",
		value = abuseCategoryModule.ABUSE_CATEGORY_SPAMMING
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Swearing",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing",
		value = abuseCategoryModule.ABUSE_CATEGORY_SWEARING
	},
	{
		localizationKey = "Feature.ReportAbuse.Problem.Violence",
		descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence",
		value = abuseCategoryModule.ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM
	}
}