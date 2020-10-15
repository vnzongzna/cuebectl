// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/operator-framework/api/pkg/operators/v1alpha1

package v1alpha1

import "github.com/operator-framework/api/pkg/lib/version"

#ClusterServiceVersionAPIVersion:     "operators.coreos.com/v1alpha1"
#ClusterServiceVersionKind:           "ClusterServiceVersion"
#OperatorGroupNamespaceAnnotationKey: "olm.operatorNamespace"
#InstallStrategyNameDeployment:       "deployment"

// InstallModeType is a supported type of install mode for CSV installation
#InstallModeType: string // #enumInstallModeType

#enumInstallModeType:
	#InstallModeTypeOwnNamespace |
	#InstallModeTypeSingleNamespace |
	#InstallModeTypeMultiNamespace |
	#InstallModeTypeAllNamespaces

// InstallModeTypeOwnNamespace indicates that the operator can be a member of an `OperatorGroup` that selects its own namespace.
#InstallModeTypeOwnNamespace: #InstallModeType & "OwnNamespace"

// InstallModeTypeSingleNamespace indicates that the operator can be a member of an `OperatorGroup` that selects one namespace.
#InstallModeTypeSingleNamespace: #InstallModeType & "SingleNamespace"

// InstallModeTypeMultiNamespace indicates that the operator can be a member of an `OperatorGroup` that selects more than one namespace.
#InstallModeTypeMultiNamespace: #InstallModeType & "MultiNamespace"

// InstallModeTypeAllNamespaces indicates that the operator can be a member of an `OperatorGroup` that selects all namespaces (target namespace set is the empty string "").
#InstallModeTypeAllNamespaces: #InstallModeType & "AllNamespaces"

// InstallMode associates an InstallModeType with a flag representing if the CSV supports it
// +k8s:openapi-gen=true
#InstallMode: {
	type:      #InstallModeType @go(Type)
	supported: bool             @go(Supported)
}

// InstallModeSet is a mapping of unique InstallModeTypes to whether they are supported.
#InstallModeSet: {[string]: bool}

// NamedInstallStrategy represents the block of an ClusterServiceVersion resource
// where the install strategy is specified.
#NamedInstallStrategy: {
	strategy: string                     @go(StrategyName)
	spec?:    #StrategyDetailsDeployment @go(StrategySpec)
}

// StrategyDeploymentPermissions describe the rbac rules and service account needed by the install strategy
#StrategyDeploymentPermissions: {
	serviceAccountName: string @go(ServiceAccountName)
	rules: [...#PolicyRule] @go(Rules,[]github.com/operator-framework/api/vendor/rbac.PolicyRule)
}

// StrategyDeploymentSpec contains the name and spec for the deployment ALM should create
#StrategyDeploymentSpec: {
	name: string          @go(Name)
	spec: #DeploymentSpec @go(Spec,github.com/operator-framework/api/vendor/appsv1.DeploymentSpec)
}

// StrategyDetailsDeployment represents the parsed details of a Deployment
// InstallStrategy.
#StrategyDetailsDeployment: {
	deployments: [...#StrategyDeploymentSpec] @go(DeploymentSpecs,[]StrategyDeploymentSpec)
	permissions?: [...#StrategyDeploymentPermissions] @go(Permissions,[]StrategyDeploymentPermissions)
	clusterPermissions?: [...#StrategyDeploymentPermissions] @go(ClusterPermissions,[]StrategyDeploymentPermissions)
}

// StatusDescriptor describes a field in a status block of a CRD so that OLM can consume it
// +k8s:openapi-gen=true
#StatusDescriptor: {
	path:         string @go(Path)
	displayName?: string @go(DisplayName)
	description?: string @go(Description)
	"x-descriptors"?: [...string] @go(XDescriptors,[]string)
	value?: _ @go(Value,json.RawMessage)
}

// SpecDescriptor describes a field in a spec block of a CRD so that OLM can consume it
// +k8s:openapi-gen=true
#SpecDescriptor: {
	path:         string @go(Path)
	displayName?: string @go(DisplayName)
	description?: string @go(Description)
	"x-descriptors"?: [...string] @go(XDescriptors,[]string)
	value?: _ @go(Value,json.RawMessage)
}

// ActionDescriptor describes a declarative action that can be performed on a custom resource instance
// +k8s:openapi-gen=true
#ActionDescriptor: {
	path:         string @go(Path)
	displayName?: string @go(DisplayName)
	description?: string @go(Description)
	"x-descriptors"?: [...string] @go(XDescriptors,[]string)
	value?: _ @go(Value,json.RawMessage)
}

// CRDDescription provides details to OLM about the CRDs
// +k8s:openapi-gen=true
#CRDDescription: {
	name:         string @go(Name)
	version:      string @go(Version)
	kind:         string @go(Kind)
	displayName?: string @go(DisplayName)
	description?: string @go(Description)
	resources?: [...#APIResourceReference] @go(Resources,[]APIResourceReference)
	statusDescriptors?: [...#StatusDescriptor] @go(StatusDescriptors,[]StatusDescriptor)
	specDescriptors?: [...#SpecDescriptor] @go(SpecDescriptors,[]SpecDescriptor)
	actionDescriptors?: [...#ActionDescriptor] @go(ActionDescriptor,[]ActionDescriptor)
}

// APIServiceDescription provides details to OLM about apis provided via aggregation
// +k8s:openapi-gen=true
#APIServiceDescription: {
	name:            string @go(Name)
	group:           string @go(Group)
	version:         string @go(Version)
	kind:            string @go(Kind)
	deploymentName?: string @go(DeploymentName)
	containerPort?:  int32  @go(ContainerPort)
	displayName?:    string @go(DisplayName)
	description?:    string @go(Description)
	resources?: [...#APIResourceReference] @go(Resources,[]APIResourceReference)
	statusDescriptors?: [...#StatusDescriptor] @go(StatusDescriptors,[]StatusDescriptor)
	specDescriptors?: [...#SpecDescriptor] @go(SpecDescriptors,[]SpecDescriptor)
	actionDescriptors?: [...#ActionDescriptor] @go(ActionDescriptor,[]ActionDescriptor)
}

// APIResourceReference is a Kubernetes resource type used by a custom resource
// +k8s:openapi-gen=true
#APIResourceReference: {
	name:    string @go(Name)
	kind:    string @go(Kind)
	version: string @go(Version)
}

// WebhookAdmissionType is the type of admission webhooks supported by OLM
#WebhookAdmissionType: string // #enumWebhookAdmissionType

#enumWebhookAdmissionType:
	#ValidatingAdmissionWebhook |
	#MutatingAdmissionWebhook

// ValidatingAdmissionWebhook is for validating admission webhooks
#ValidatingAdmissionWebhook: #WebhookAdmissionType & "ValidatingAdmissionWebhook"

// MutatingAdmissionWebhook is for mutating admission webhooks
#MutatingAdmissionWebhook: #WebhookAdmissionType & "MutatingAdmissionWebhook"

// WebhookDescription provides details to OLM about required webhooks
// +k8s:openapi-gen=true
#WebhookDescription: {
	generateName: string @go(GenerateName)

	// +kubebuilder:validation:Enum=ValidatingAdmissionWebhook;MutatingAdmissionWebhook
	type:            #WebhookAdmissionType @go(Type)
	deploymentName?: string                @go(DeploymentName)
	containerPort?:  int32                 @go(ContainerPort)
	rules?: [...#RuleWithOperations] @go(Rules,[]github.com/operator-framework/api/vendor/admissionregistrationv1.RuleWithOperations)
	failurePolicy?:  null | #FailurePolicyType @go(FailurePolicy,*github.com/operator-framework/api/vendor/admissionregistrationv1.FailurePolicyType)
	matchPolicy?:    null | #MatchPolicyType   @go(MatchPolicy,*github.com/operator-framework/api/vendor/admissionregistrationv1.MatchPolicyType)
	objectSelector?: null | #LabelSelector     @go(ObjectSelector,*github.com/operator-framework/api/vendor/metav1.LabelSelector)
	sideEffects?:    null | #SideEffectClass   @go(SideEffects,*github.com/operator-framework/api/vendor/admissionregistrationv1.SideEffectClass)
	timeoutSeconds?: null | int32              @go(TimeoutSeconds,*int32)
	admissionReviewVersions: [...string] @go(AdmissionReviewVersions,[]string)
	reinvocationPolicy?: null | #ReinvocationPolicyType @go(ReinvocationPolicy,*github.com/operator-framework/api/vendor/admissionregistrationv1.ReinvocationPolicyType)
	webhookPath?:        null | string                  @go(WebhookPath,*string)
}

// CustomResourceDefinitions declares all of the CRDs managed or required by
// an operator being ran by ClusterServiceVersion.
//
// If the CRD is present in the Owned list, it is implicitly required.
// +k8s:openapi-gen=true
#CustomResourceDefinitions: {
	owned?: [...#CRDDescription] @go(Owned,[]CRDDescription)
	required?: [...#CRDDescription] @go(Required,[]CRDDescription)
}

// APIServiceDefinitions declares all of the extension apis managed or required by
// an operator being ran by ClusterServiceVersion.
// +k8s:openapi-gen=true
#APIServiceDefinitions: {
	owned?: [...#APIServiceDescription] @go(Owned,[]APIServiceDescription)
	required?: [...#APIServiceDescription] @go(Required,[]APIServiceDescription)
}

// ClusterServiceVersionSpec declarations tell OLM how to install an operator
// that can manage apps for a given version.
#ClusterServiceVersionSpec: {
	install:                    #NamedInstallStrategy      @go(InstallStrategy)
	"version"?:                 version.#OperatorVersion   @go(Version)
	maturity?:                  string                     @go(Maturity)
	customresourcedefinitions?: #CustomResourceDefinitions @go(CustomResourceDefinitions)
	apiservicedefinitions?:     #APIServiceDefinitions     @go(APIServiceDefinitions)
	webhookdefinitions?: [...#WebhookDescription] @go(WebhookDefinitions,[]WebhookDescription)
	nativeAPIs?: [...#GroupVersionKind] @go(NativeAPIs,[]github.com/operator-framework/api/vendor/metav1.GroupVersionKind)
	minKubeVersion?: string @go(MinKubeVersion)
	displayName:     string @go(DisplayName)
	description?:    string @go(Description)
	keywords?: [...string] @go(Keywords,[]string)
	maintainers?: [...#Maintainer] @go(Maintainers,[]Maintainer)
	provider?: #AppLink @go(Provider)
	links?: [...#AppLink] @go(Links,[]AppLink)
	icon?: [...#Icon] @go(Icon,[]Icon)

	// InstallModes specify supported installation types
	// +optional
	installModes?: [...#InstallMode] @go(InstallModes,[]InstallMode)

	// The name of a CSV this one replaces. Should match the `metadata.Name` field of the old CSV.
	// +optional
	replaces?: string @go(Replaces)

	// Map of string keys and values that can be used to organize and categorize
	// (scope and select) objects.
	// +optional
	labels?: {[string]: string} @go(Labels,map[string]string) @protobuf(11,bytes,rep)

	// Annotations is an unstructured key value map stored with a resource that may be
	// set by external tools to store and retrieve arbitrary metadata.
	// +optional
	annotations?: {[string]: string} @go(Annotations,map[string]string) @protobuf(12,bytes,rep)

	// Label selector for related resources.
	// +optional
	selector?: null | #LabelSelector @go(Selector,*github.com/operator-framework/api/vendor/metav1.LabelSelector) @protobuf(2,bytes,opt)
}

#Maintainer: {
	name?:  string @go(Name)
	email?: string @go(Email)
}

#AppLink: {
	name?: string @go(Name)
	url?:  string @go(URL)
}

#Icon: {
	base64data: string @go(Data)
	mediatype:  string @go(MediaType)
}

// ClusterServiceVersionPhase is a label for the condition of a ClusterServiceVersion at the current time.
#ClusterServiceVersionPhase: string // #enumClusterServiceVersionPhase

#enumClusterServiceVersionPhase:
	#CSVPhasePending |
	#CSVPhaseInstallReady |
	#CSVPhaseInstalling |
	#CSVPhaseSucceeded |
	#CSVPhaseFailed |
	#CSVPhaseUnknown |
	#CSVPhaseReplacing |
	#CSVPhaseDeleting |
	#CSVPhaseAny

#CSVPhaseNone: ""

// CSVPhasePending means the csv has been accepted by the system, but the install strategy has not been attempted.
// This is likely because there are unmet requirements.
#CSVPhasePending: #ClusterServiceVersionPhase & "Pending"

// CSVPhaseInstallReady means that the requirements are met but the install strategy has not been run.
#CSVPhaseInstallReady: #ClusterServiceVersionPhase & "InstallReady"

// CSVPhaseInstalling means that the install strategy has been initiated but not completed.
#CSVPhaseInstalling: #ClusterServiceVersionPhase & "Installing"

// CSVPhaseSucceeded means that the resources in the CSV were created successfully.
#CSVPhaseSucceeded: #ClusterServiceVersionPhase & "Succeeded"

// CSVPhaseFailed means that the install strategy could not be successfully completed.
#CSVPhaseFailed: #ClusterServiceVersionPhase & "Failed"

// CSVPhaseUnknown means that for some reason the state of the csv could not be obtained.
#CSVPhaseUnknown: #ClusterServiceVersionPhase & "Unknown"

// CSVPhaseReplacing means that a newer CSV has been created and the csv's resources will be transitioned to a new owner.
#CSVPhaseReplacing: #ClusterServiceVersionPhase & "Replacing"

// CSVPhaseDeleting means that a CSV has been replaced by a new one and will be checked for safety before being deleted
#CSVPhaseDeleting: #ClusterServiceVersionPhase & "Deleting"

// CSVPhaseAny matches all other phases in CSV queries
#CSVPhaseAny: #ClusterServiceVersionPhase & ""

// ConditionReason is a camelcased reason for the state transition
#ConditionReason: string // #enumConditionReason

#enumConditionReason:
	#CatalogSourceSpecInvalidError |
	#CatalogSourceConfigMapError |
	#CatalogSourceRegistryServerError |
	#CSVReasonRequirementsUnknown |
	#CSVReasonRequirementsNotMet |
	#CSVReasonRequirementsMet |
	#CSVReasonOwnerConflict |
	#CSVReasonComponentFailed |
	#CSVReasonComponentFailedNoRetry |
	#CSVReasonInvalidStrategy |
	#CSVReasonWaiting |
	#CSVReasonInstallSuccessful |
	#CSVReasonInstallCheckFailed |
	#CSVReasonComponentUnhealthy |
	#CSVReasonBeingReplaced |
	#CSVReasonReplaced |
	#CSVReasonNeedsReinstall |
	#CSVReasonNeedsCertRotation |
	#CSVReasonAPIServiceResourceIssue |
	#CSVReasonAPIServiceResourcesNeedReinstall |
	#CSVReasonAPIServiceInstallFailed |
	#CSVReasonCopied |
	#CSVReasonInvalidInstallModes |
	#CSVReasonNoTargetNamespaces |
	#CSVReasonUnsupportedOperatorGroup |
	#CSVReasonNoOperatorGroup |
	#CSVReasonTooManyOperatorGroups |
	#CSVReasonInterOperatorGroupOwnerConflict |
	#CSVReasonCannotModifyStaticOperatorGroupProvidedAPIs |
	#CSVReasonDetectedClusterChange |
	#CSVReasonInvalidWebhookDescription |
	#SubscriptionReasonInvalidCatalog |
	#SubscriptionReasonUpgradeSucceeded

#CSVReasonRequirementsUnknown:                         #ConditionReason & "RequirementsUnknown"
#CSVReasonRequirementsNotMet:                          #ConditionReason & "RequirementsNotMet"
#CSVReasonRequirementsMet:                             #ConditionReason & "AllRequirementsMet"
#CSVReasonOwnerConflict:                               #ConditionReason & "OwnerConflict"
#CSVReasonComponentFailed:                             #ConditionReason & "InstallComponentFailed"
#CSVReasonComponentFailedNoRetry:                      #ConditionReason & "InstallComponentFailedNoRetry"
#CSVReasonInvalidStrategy:                             #ConditionReason & "InvalidInstallStrategy"
#CSVReasonWaiting:                                     #ConditionReason & "InstallWaiting"
#CSVReasonInstallSuccessful:                           #ConditionReason & "InstallSucceeded"
#CSVReasonInstallCheckFailed:                          #ConditionReason & "InstallCheckFailed"
#CSVReasonComponentUnhealthy:                          #ConditionReason & "ComponentUnhealthy"
#CSVReasonBeingReplaced:                               #ConditionReason & "BeingReplaced"
#CSVReasonReplaced:                                    #ConditionReason & "Replaced"
#CSVReasonNeedsReinstall:                              #ConditionReason & "NeedsReinstall"
#CSVReasonNeedsCertRotation:                           #ConditionReason & "NeedsCertRotation"
#CSVReasonAPIServiceResourceIssue:                     #ConditionReason & "APIServiceResourceIssue"
#CSVReasonAPIServiceResourcesNeedReinstall:            #ConditionReason & "APIServiceResourcesNeedReinstall"
#CSVReasonAPIServiceInstallFailed:                     #ConditionReason & "APIServiceInstallFailed"
#CSVReasonCopied:                                      #ConditionReason & "Copied"
#CSVReasonInvalidInstallModes:                         #ConditionReason & "InvalidInstallModes"
#CSVReasonNoTargetNamespaces:                          #ConditionReason & "NoTargetNamespaces"
#CSVReasonUnsupportedOperatorGroup:                    #ConditionReason & "UnsupportedOperatorGroup"
#CSVReasonNoOperatorGroup:                             #ConditionReason & "NoOperatorGroup"
#CSVReasonTooManyOperatorGroups:                       #ConditionReason & "TooManyOperatorGroups"
#CSVReasonInterOperatorGroupOwnerConflict:             #ConditionReason & "InterOperatorGroupOwnerConflict"
#CSVReasonCannotModifyStaticOperatorGroupProvidedAPIs: #ConditionReason & "CannotModifyStaticOperatorGroupProvidedAPIs"
#CSVReasonDetectedClusterChange:                       #ConditionReason & "DetectedClusterChange"
#CSVReasonInvalidWebhookDescription:                   #ConditionReason & "InvalidWebhookDescription"

// Conditions appear in the status as a record of state transitions on the ClusterServiceVersion
#ClusterServiceVersionCondition: {
	// Condition of the ClusterServiceVersion
	phase?: #ClusterServiceVersionPhase @go(Phase)

	// A human readable message indicating details about why the ClusterServiceVersion is in this condition.
	// +optional
	message?: string @go(Message)

	// A brief CamelCase message indicating details about why the ClusterServiceVersion is in this state.
	// e.g. 'RequirementsNotMet'
	// +optional
	reason?: #ConditionReason @go(Reason)

	// Last time we updated the status
	// +optional
	lastUpdateTime?: null | #Time @go(LastUpdateTime,*github.com/operator-framework/api/vendor/metav1.Time)

	// Last time the status transitioned from one status to another.
	// +optional
	lastTransitionTime?: null | #Time @go(LastTransitionTime,*github.com/operator-framework/api/vendor/metav1.Time)
}

// StatusReason is a camelcased reason for the status of a RequirementStatus or DependentStatus
#StatusReason: string // #enumStatusReason

#enumStatusReason:
	#RequirementStatusReasonPresent |
	#RequirementStatusReasonNotPresent |
	#RequirementStatusReasonPresentNotSatisfied |
	#RequirementStatusReasonNotAvailable |
	#DependentStatusReasonSatisfied |
	#DependentStatusReasonNotSatisfied

#RequirementStatusReasonPresent:             #StatusReason & "Present"
#RequirementStatusReasonNotPresent:          #StatusReason & "NotPresent"
#RequirementStatusReasonPresentNotSatisfied: #StatusReason & "PresentNotSatisfied"

// The CRD is present but the Established condition is False (not available)
#RequirementStatusReasonNotAvailable: #StatusReason & "PresentNotAvailable"
#DependentStatusReasonSatisfied:      #StatusReason & "Satisfied"
#DependentStatusReasonNotSatisfied:   #StatusReason & "NotSatisfied"

// DependentStatus is the status for a dependent requirement (to prevent infinite nesting)
#DependentStatus: {
	group:    string        @go(Group)
	version:  string        @go(Version)
	kind:     string        @go(Kind)
	status:   #StatusReason @go(Status)
	uuid?:    string        @go(UUID)
	message?: string        @go(Message)
}

#RequirementStatus: {
	group:   string        @go(Group)
	version: string        @go(Version)
	kind:    string        @go(Kind)
	name:    string        @go(Name)
	status:  #StatusReason @go(Status)
	message: string        @go(Message)
	uuid?:   string        @go(UUID)
	dependents?: [...#DependentStatus] @go(Dependents,[]DependentStatus)
}

// ClusterServiceVersionStatus represents information about the status of a pod. Status may trail the actual
// state of a system.
#ClusterServiceVersionStatus: {
	// Current condition of the ClusterServiceVersion
	phase?: #ClusterServiceVersionPhase @go(Phase)

	// A human readable message indicating details about why the ClusterServiceVersion is in this condition.
	// +optional
	message?: string @go(Message)

	// A brief CamelCase message indicating details about why the ClusterServiceVersion is in this state.
	// e.g. 'RequirementsNotMet'
	// +optional
	reason?: #ConditionReason @go(Reason)

	// Last time we updated the status
	// +optional
	lastUpdateTime?: null | #Time @go(LastUpdateTime,*github.com/operator-framework/api/vendor/metav1.Time)

	// Last time the status transitioned from one status to another.
	// +optional
	lastTransitionTime?: null | #Time @go(LastTransitionTime,*github.com/operator-framework/api/vendor/metav1.Time)

	// List of conditions, a history of state transitions
	conditions?: [...#ClusterServiceVersionCondition] @go(Conditions,[]ClusterServiceVersionCondition)

	// The status of each requirement for this CSV
	requirementStatus?: [...#RequirementStatus] @go(RequirementStatus,[]RequirementStatus)

	// Last time the owned APIService certs were updated
	// +optional
	certsLastUpdated?: null | #Time @go(CertsLastUpdated,*github.com/operator-framework/api/vendor/metav1.Time)

	// Time the owned APIService certs will rotate next
	// +optional
	certsRotateAt?: null | #Time @go(CertsRotateAt,*github.com/operator-framework/api/vendor/metav1.Time)
}

// ClusterServiceVersion is a Custom Resource of type `ClusterServiceVersionSpec`.
#ClusterServiceVersion: {
	#TypeMeta
	metadata: #ObjectMeta                @go(ObjectMeta,github.com/operator-framework/api/vendor/metav1.ObjectMeta)
	spec:     #ClusterServiceVersionSpec @go(Spec)

	// +optional
	status: #ClusterServiceVersionStatus @go(Status)
}

// ClusterServiceVersionList represents a list of ClusterServiceVersions.
#ClusterServiceVersionList: {
	#TypeMeta
	metadata: #ListMeta @go(ListMeta,github.com/operator-framework/api/vendor/metav1.ListMeta)
	items: [...#ClusterServiceVersion] @go(Items,[]ClusterServiceVersion)
}
