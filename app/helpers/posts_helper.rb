module PostsHelper
  def job_type(post)
    if post.job_type == "Full-Time"
      content_tag :span, "#{post.job_type}", class: 'tag is-primary'
    elsif post.job_type == "Part-Time"
      content_tag :span, "#{post.job_type}", class: 'tag is-link'
    elsif post.job_type == "Contract"
      content_tag :span, "#{post.job_type}", class: 'tag is-warning'
    elsif post.job_type == "Freelance"
      content_tag :span, "#{post.job_type}", class: 'tag is-info'
    else
      ''
    end
  end
end
