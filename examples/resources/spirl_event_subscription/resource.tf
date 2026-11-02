# Deliver SVID-issued events from one trust domain to an HTTPS endpoint.
resource "spirl_event_subscription" "svid_events" {
  url              = "https://events.example.com/spirl"
  event_types      = ["svid-issued"]
  trust_domain_ids = [spirl_trust_domain.my_domain.id]
}
